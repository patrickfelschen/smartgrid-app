import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargeRequestCreationController extends StateNotifier<AsyncValue<void>> {
  ChargeRequestCreationController({required this.chargePlanService})
      : super(const AsyncData<void>(null));

  final ChargePlanService chargePlanService;

  Future<void> createChargePlan(
      ChargeRequestCreationDTO chargeRequestCreationDTO) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<ChargePlanEntity>(
      () => chargePlanService.createChargePlan(chargeRequestCreationDTO),
    );
  }
}

final chargeRequestCreationControllerProvider = StateNotifierProvider
    .autoDispose<ChargeRequestCreationController, AsyncValue<void>>((ref) {
  return ChargeRequestCreationController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
  );
});
