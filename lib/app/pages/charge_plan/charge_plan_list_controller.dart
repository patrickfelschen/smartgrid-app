import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanListController extends StateNotifier<AsyncValue<void>> {
  ChargePlanListController({required this.chargePlanService})
      : super(const AsyncValue.loading()) {
    getAllChargePlans();
  }

  final ChargePlanService chargePlanService;
  final List<ChargePlanEntity> plans = [];

  Future<void> getAllChargePlans() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => chargePlanService.getAllChargePlans(),
    );
  }
}

final chargePlanListControllerProvider =
    StateNotifierProvider.autoDispose<ChargePlanListController, AsyncValue>(
        (ref) {
  return ChargePlanListController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
  );
});
