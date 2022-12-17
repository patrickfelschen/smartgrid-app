import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestEntity {
  final int id;
  final DeviceEntity deviceEntity;
  final double requiredPower;
  final double capacity;
  final DateTime deadline;

  ChargeRequestEntity({
    required this.id,
    required this.deviceEntity,
    required this.requiredPower,
    required this.capacity,
    required this.deadline,
  });

  @override
  String toString() {
    return "$id $deviceEntity $requiredPower $capacity $deadline";
  }
}
