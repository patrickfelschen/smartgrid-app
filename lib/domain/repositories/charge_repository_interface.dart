import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';

abstract class ChargeRepositoryInterface {
  Future<ChargeRequestEntity> createChargeRequest(
    int customerId,
    int deviceId,
    double maxRequiredPower,
    double requiredCapacity,
    DateTime deadline,
  );

  Future<List<ChargePlanEntity>> getAllChargePlans(int customerId);

  Future<ChargePlanEntity> getChargePlan(int customerId, int chargePlanId);
}
