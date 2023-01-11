// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_creation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceCreationDTO _$$_DeviceCreationDTOFromJson(Map<String, dynamic> json) =>
    _$_DeviceCreationDTO(
      id: json['id'] as int,
      description: json['description'] as String,
      maxPower: (json['maxPower'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DeviceCreationDTOToJson(
        _$_DeviceCreationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'maxPower': instance.maxPower,
    };
