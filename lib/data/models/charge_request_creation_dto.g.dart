// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_request_creation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargeRequestCreationDTO _$$_ChargeRequestCreationDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ChargeRequestCreationDTO(
      maxRequiredPower: (json['maxRequiredPower'] as num).toDouble(),
      requiredCapacity: (json['requiredCapacity'] as num).toDouble(),
      deadline: DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$$_ChargeRequestCreationDTOToJson(
        _$_ChargeRequestCreationDTO instance) =>
    <String, dynamic>{
      'maxRequiredPower': instance.maxRequiredPower,
      'requiredCapacity': instance.requiredCapacity,
      'deadline': instance.deadline.toIso8601String(),
    };
