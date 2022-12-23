// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargeRequestDTO _$$_ChargeRequestDTOFromJson(Map<String, dynamic> json) =>
    _$_ChargeRequestDTO(
      id: json['id'] as int,
      maxRequiredPower: (json['maxRequiredPower'] as num).toDouble(),
      requiredCapacity: (json['requiredCapacity'] as num).toDouble(),
      deadline: DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$$_ChargeRequestDTOToJson(_$_ChargeRequestDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maxRequiredPower': instance.maxRequiredPower,
      'requiredCapacity': instance.requiredCapacity,
      'deadline': instance.deadline.toIso8601String(),
    };
