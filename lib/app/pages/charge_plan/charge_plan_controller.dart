import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';

class ChargePlanController extends StateNotifier<AsyncValue<void>> {
  ChargePlanController({required this.chargePlanService})
      : super(const AsyncData<void>(null));

  final ChargePlanService chargePlanService;

  Future<void> getChargePlan() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => chargePlanService.getChargePlan(1),
    );
  }
}

final chargePlanControllerProvider =
    StateNotifierProvider.autoDispose<ChargePlanController, AsyncValue<void>>(
        (ref) {
  return ChargePlanController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
  );
});
