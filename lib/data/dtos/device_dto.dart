import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceDTO {
  final int id;
  final String description;
  final double maxPower;

  const DeviceDTO({
    required this.id,
    required this.description,
    required this.maxPower,
  });

  factory DeviceDTO.fromMap(Map<String, dynamic> map) {
    return DeviceDTO(
      id: map["id"] as int,
      description: map["description"] as String,
      maxPower: map["maxPower"] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "description": description,
      "maxPower": maxPower,
    };
  }

  static DeviceEntity fromDTO(DeviceDTO dto) {
    return DeviceEntity(
      id: dto.id,
      description: dto.description,
      maxPower: dto.maxPower,
    );
  }
}
