import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

part 'charge_plan_controller.freezed.dart';

@freezed
class ChargePlanState with _$ChargePlanState {
  const factory ChargePlanState({
    @Default(null) ChargePlanEntity? chargePlan,
    @Default(StateStatus.initial) StateStatus status,
  }) = _ChargePlanState;

  const ChargePlanState._();
}

final chargePlanControllerProvider =
    StateNotifierProvider<ChargePlanController, ChargePlanState>(
  (ref) => ChargePlanController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
  ),
);

class ChargePlanController extends StateNotifier<ChargePlanState> {
  ChargePlanController({required this.chargePlanService})
      : super(const ChargePlanState());

  final ChargePlanService chargePlanService;

  void getChargePlan(int chargePlanId) async {
    state = state.copyWith(status: StateStatus.loading);
    print(state.status);
    ChargePlanEntity chargePlan = await chargePlanService.getChargePlan(
      chargePlanId,
    );
    if (chargePlan != null) {
      state = state.copyWith(
        status: StateStatus.success,
        chargePlan: chargePlan,
      );
      print(state.status);
    } else {
      state = state.copyWith(status: StateStatus.failure);
      print(state.status);
    }
  }
}
