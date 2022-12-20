import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestDTO {
  final int id;
  final DeviceEntity deviceEntity;
  final double requiredPower;
  final double capacity;
  final DateTime deadline;

  ChargeRequestDTO({
    required this.id,
    required this.deviceEntity,
    required this.requiredPower,
    required this.capacity,
    required this.deadline,
  });

  factory ChargeRequestDTO.fromMap(Map<String, dynamic> map) {
    return ChargeRequestDTO(
      id: map["id"],
      deviceEntity: map["deviceEntity"],
      requiredPower: map["requiredPower"],
      capacity: map["capacity"],
      deadline: map["deadline"],
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

  static ChargeRequestEntity fromDTO(ChargeRequestDTO dto) {
    return ChargeRequestEntity(
      id: dto.id,
      deviceEntity: dto.deviceEntity,
      requiredPower: dto.requiredPower,
      capacity: dto.capacity,
      deadline: dto.deadline,
    );
  }
}
