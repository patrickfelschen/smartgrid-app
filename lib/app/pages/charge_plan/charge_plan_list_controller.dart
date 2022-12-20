import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';

class ChargePlanListController extends StateNotifier<AsyncValue<void>> {
  ChargePlanListController({required this.chargePlanService})
      : super(const AsyncData<void>(null));

  final ChargePlanService chargePlanService;

  Future<void> getAllChargePlans() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => chargePlanService.getAllChargePlans(),
    );
  }
}

final chargePlanListControllerProvider = StateNotifierProvider.autoDispose<
    ChargePlanListController, AsyncValue<void>>((ref) {
  return ChargePlanListController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
  );
});
