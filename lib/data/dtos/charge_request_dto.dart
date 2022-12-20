import 'package:smartgrid/domain/entities/charge_request_entity.dart';

class ChargeRequestDTO {
  final int id;
  final double maxRequiredPower;
  final double requiredCapacity;
  final DateTime deadline;

  ChargeRequestDTO({
    required this.id,
    required this.maxRequiredPower,
    required this.requiredCapacity,
    required this.deadline,
  });

  factory ChargeRequestDTO.fromMap(Map<String, dynamic> map) {
    return ChargeRequestDTO(
      id: map["id"],
      maxRequiredPower: map["maxRequiredPower"],
      requiredCapacity: map["requiredCapacity"],
      deadline: map["postalcode"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "maxRequiredPower": maxRequiredPower,
      "requiredCapacity": requiredCapacity,
      "deadline": deadline,
    };
  }

  static ChargeRequestEntity fromDTO(ChargeRequestDTO dto) {
    return ChargeRequestEntity(
      id: dto.id,
      maxRequiredPower: dto.maxRequiredPower,
      requiredCapacity: dto.requiredCapacity,
      deadline: dto.deadline,
    );
  }

  @override
  String toString() {
    return "$maxRequiredPower $requiredCapacity $deadline";
  }
}
