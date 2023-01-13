import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_creation_dto.freezed.dart';
part 'device_creation_dto.g.dart';

@freezed
class DeviceCreationDTO with _$DeviceCreationDTO {
  factory DeviceCreationDTO({
    required int id,
    required String description,
    required double maxPower,
  }) = _DeviceCreationDTO;

  factory DeviceCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$DeviceCreationDTOFromJson(json);
}
