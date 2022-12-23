// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceDTO _$$_DeviceDTOFromJson(Map<String, dynamic> json) => _$_DeviceDTO(
      id: json['id'] as int,
      description: json['description'] as String,
      maxPower: (json['maxPower'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DeviceDTOToJson(_$_DeviceDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'maxPower': instance.maxPower,
    };
