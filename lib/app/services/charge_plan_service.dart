import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/data/repositories/charge_plan_repository.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanService {
  ChargePlanService(this.ref);

  final Ref ref;

  Future<ChargePlanEntity> createChargePlan(
      ChargeRequestCreationDTO chargeRequestCreationDTO) async {
    ChargePlanEntity chargePlanEntity =
        await ref.read(chargePlanRepositoryProvider).createChargePlan(
              chargeRequestCreationDTO.id,
              chargeRequestCreationDTO.deviceEntity,
              chargeRequestCreationDTO.requiredPower,
              chargeRequestCreationDTO.capacity,
              chargeRequestCreationDTO.deadline,
            );
    return chargePlanEntity;
  }
}

final chargePlanServiceProvider = Provider<ChargePlanService>((ref) {
  return ChargePlanService(ref);
});
