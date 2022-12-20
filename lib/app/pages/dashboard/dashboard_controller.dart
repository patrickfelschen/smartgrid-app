import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/dashboard_service.dart';

class DashboardController extends StateNotifier<AsyncValue<void>> {
  DashboardController({required this.dashboardService})
      : super(const AsyncData<void>(null));

  final DashboardService dashboardService;

  Future<void> getDashboardInfo(int id) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => dashboardService.getDashboardInfo(id),
    );
  }
}

final dashboardControllerProvider =
    StateNotifierProvider.autoDispose<DashboardController, AsyncValue<void>>(
        (ref) {
  return DashboardController(
    dashboardService: ref.watch(dashboardServiceProvider),
  );
});
