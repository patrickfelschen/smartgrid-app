import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestCreationDTO {
  final int id;
  final DeviceEntity deviceEntity;
  final double requiredPower;
  final double capacity;
  final DateTime deadline;

  ChargeRequestCreationDTO({
    required this.id,
    required this.deviceEntity,
    required this.requiredPower,
    required this.capacity,
    required this.deadline,
  });

  factory ChargeRequestCreationDTO.fromMap(Map<String, dynamic> map) {
    return ChargeRequestCreationDTO(
      id: map["id"],
      deviceEntity: map["deviceEntity"],
      requiredPower: map["street"],
      capacity: map["number"],
      deadline: map["postalcode"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "deviceEntity": deviceEntity,
      "requiredPower": requiredPower,
      "capacity": capacity,
      "deadline": deadline,
    };
  }

  @override
  String toString() {
    return "$id $deviceEntity $requiredPower $capacity $deadline";
  }
}
