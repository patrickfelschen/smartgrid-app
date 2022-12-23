import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_update_dto.freezed.dart';
part 'device_update_dto.g.dart';

@unfreezed
class DeviceUpdateDTO with _$DeviceUpdateDTO {
  factory DeviceUpdateDTO({
    required String description,
    required double maxPower,
  }) = _DeviceUpdateDTO;

  factory DeviceUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$DeviceUpdateDTOFromJson(json);
}
