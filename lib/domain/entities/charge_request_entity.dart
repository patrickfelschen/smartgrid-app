import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestEntity {
  final int id;
  final DeviceEntity deviceEntity;
  final double maxRequiredPower;
  final double requiredCapacity;
  final DateTime deadline;

  ChargeRequestEntity({
    required this.id,
    required this.deviceEntity,
    required this.maxRequiredPower,
    required this.requiredCapacity,
    required this.deadline,
  });

  @override
  String toString() {
    return "$id $deviceEntity $maxRequiredPower $requiredCapacity $deadline";
  }
}
