import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/dashboard_service.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

part 'dashboard_controller.freezed.dart';

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController({required this.dashboardService})
      : super(const DashboardState()) {
    getDashboardInfo();
  }

  final DashboardService dashboardService;

  Future<void> getDashboardInfo() async {
    print("DashboardController::getDashboardInfo");
    state = state.copyWith(status: StateStatus.loading);
    print("DashboardState::Loading");
    DashboardInfoEntity dashboardInfo =
        await dashboardService.getDashboardInfo();
    if (dashboardInfo != null) {
      state = state.copyWith(
        status: StateStatus.success,
        dashboardInfo: dashboardInfo,
      );
      print("DashboardState::Success");
    } else {
      state = state.copyWith(
          status: StateStatus.failure, error: "Error receiving Dashboard Info");
      print("DashboardState::Error");
    }
  }
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(null) DashboardInfoEntity? dashboardInfo,
    @Default(StateStatus.initial) StateStatus status,
    @Default("") String? error,
  }) = _DashboardState;

  const DashboardState._();
}

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>(
  (ref) => DashboardController(
    dashboardService: ref.watch(dashboardServiceProvider),
  ),
);
