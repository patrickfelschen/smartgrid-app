import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

part 'device_dto.freezed.dart';
part 'device_dto.g.dart';

@unfreezed
class DeviceDTO with _$DeviceDTO {
  factory DeviceDTO({
    required int id,
    required String description,
    required double maxPower,
  }) = _DeviceDTO;

  static DeviceEntity fromDTO(DeviceDTO dto) => DeviceEntity(
        id: dto.id,
        description: dto.description,
        maxPower: dto.maxPower,
      );

  factory DeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$DeviceDTOFromJson(json);
}
