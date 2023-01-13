import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';
import 'package:smartgrid/data/repositories/auth_customer_repository.dart';
import 'package:smartgrid/data/repositories/charge_repository.dart';
import 'package:smartgrid/data/repositories/test/test_charge_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository_interface.dart';
import 'package:smartgrid/domain/repositories/charge_repository_interface.dart';
import 'package:smartgrid/utils/constants.dart';

final chargePlanServiceProvider = Provider<ChargePlanService>((ref) {
  return ChargePlanService(ref);
});

class ChargePlanService {
  ChargePlanService(this.ref);

  final Ref ref;

  final Provider<AuthRepositoryInterface> _authRepository = Constants.testMode
      ? testCustomerRepositoryProvider
      : authCustomerRepositoryProvider;
  final Provider<ChargeRepositoryInterface> _chargeRepository =
      Constants.testMode
          ? testChargeRepositoryProvider
          : chargeRepositoryProvider;

  Future<ChargeRequestEntity> createChargeRequest(
    int deviceId,
    ChargeRequestCreationDTO creationDto,
  ) async {
    CustomerEntity? currentCustomer =
        await ref.read(_authRepository).getCurrentUser();

    ChargeRequestEntity chargeRequestEntity =
        await ref.read(_chargeRepository).createChargeRequest(
              currentCustomer!.id,
              deviceId,
              creationDto.maxRequiredPower,
              creationDto.requiredCapacity,
              creationDto.deadline,
            );
    return chargeRequestEntity;
  }

  Future<List<ChargePlanEntity>> getAllChargePlans() async {
    CustomerEntity? currentCustomer =
        await ref.read(_authRepository).getCurrentUser();

    List<ChargePlanEntity> chargePlans =
        await ref.read(_chargeRepository).getAllChargePlans(
              currentCustomer!.id,
            );
    return chargePlans;
  }

  Future<ChargePlanEntity> getChargePlan(int chargePlanId) async {
    CustomerEntity? currentCustomer =
        await ref.read(_authRepository).getCurrentUser();

    ChargePlanEntity chargePlanEntity =
        await ref.read(_chargeRepository).getChargePlan(
              currentCustomer!.id,
              chargePlanId,
            );
    return chargePlanEntity;
  }
}
