import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/data/repositories/charge_repository.dart';
import 'package:smartgrid/data/repositories/customer_repository.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

class ChargePlanService {
  ChargePlanService(this.ref);

  final Ref ref;

  Future<ChargeRequestEntity> createChargeRequest(
    int deviceId,
    ChargeRequestCreationDTO creationDto,
  ) async {
    CustomerEntity? currentCustomer =
        await ref.read(customerRepositoryProvider).getCurrentUser();

    ChargeRequestEntity chargeRequestEntity =
        await ref.read(chargeRepositoryProvider).createChargeRequest(
              currentCustomer!.id,
              deviceId,
              creationDto.maxRequiredPower,
              creationDto.requiredCapacity,
              creationDto.deadline,
            );

    return chargeRequestEntity;
  }

  Future<List<ChargePlanEntity>> getAllChargePlans() async {
    List<ChargePlanEntity> chargePlans =
        await ref.read(chargeRepositoryProvider).getAllChargePlans();

    return chargePlans;
  }

  Future<ChargePlanEntity> getChargePlan(int id) async {
    ChargePlanEntity chargePlanEntity =
        await ref.read(chargeRepositoryProvider).getChargePlan(id);
    return chargePlanEntity;
  }
}

final chargePlanServiceProvider = Provider<ChargePlanService>((ref) {
  return ChargePlanService(ref);
});
