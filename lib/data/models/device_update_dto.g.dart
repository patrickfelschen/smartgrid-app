// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceUpdateDTO _$$_DeviceUpdateDTOFromJson(Map<String, dynamic> json) =>
    _$_DeviceUpdateDTO(
      description: json['description'] as String,
      maxPower: (json['maxPower'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DeviceUpdateDTOToJson(_$_DeviceUpdateDTO instance) =>
    <String, dynamic>{
      'description': instance.description,
      'maxPower': instance.maxPower,
    };
