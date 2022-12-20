import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestDTO {
  final int id;
  final DeviceEntity deviceEntity;
  final double maxRequiredPower;
  final double requiredCapacity;
  final DateTime deadline;

  ChargeRequestDTO({
    required this.id,
    required this.deviceEntity,
    required this.maxRequiredPower,
    required this.requiredCapacity,
    required this.deadline,
  });

  factory ChargeRequestDTO.fromMap(Map<String, dynamic> map) {
    return ChargeRequestDTO(
      id: map["id"],
      deviceEntity: map["deviceEntity"],
      maxRequiredPower: map["maxRequiredPower"],
      requiredCapacity: map["requiredCapacity"],
      deadline: map["deadline"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "deviceEntity": deviceEntity,
      "maxRequiredPower": maxRequiredPower,
      "requiredCapacity": requiredCapacity,
      "deadline": deadline,
    };
  }

  static ChargeRequestEntity fromDTO(ChargeRequestDTO dto) {
    return ChargeRequestEntity(
      id: dto.id,
      deviceEntity: dto.deviceEntity,
      maxRequiredPower: dto.maxRequiredPower,
      requiredCapacity: dto.requiredCapacity,
      deadline: dto.deadline,
    );
  }
}
