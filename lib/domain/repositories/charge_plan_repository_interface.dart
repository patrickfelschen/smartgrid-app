import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

abstract class ChargePlanRepositoryInterface {
  Future<ChargePlanEntity> createChargePlan(
    int id,
    DeviceEntity device,
    double requiredPower,
    double capacity,
    DateTime deadline,
  );
}
