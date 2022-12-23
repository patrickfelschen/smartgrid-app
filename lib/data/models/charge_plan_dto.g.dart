// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargePlanDTO _$$_ChargePlanDTOFromJson(Map<String, dynamic> json) =>
    _$_ChargePlanDTO(
      id: json['id'] as int,
      device: DeviceDTO.fromJson(json['device'] as Map<String, dynamic>),
      request:
          ChargeRequestDTO.fromJson(json['request'] as Map<String, dynamic>),
      co2ValueSmart: (json['co2ValueSmart'] as num).toDouble(),
      co2ValueNotSmart: (json['co2ValueNotSmart'] as num).toDouble(),
      times: (json['times'] as List<dynamic>)
          .map((e) => ChargePlanTimeDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_ChargePlanDTOToJson(_$_ChargePlanDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device': instance.device,
      'request': instance.request,
      'co2ValueSmart': instance.co2ValueSmart,
      'co2ValueNotSmart': instance.co2ValueNotSmart,
      'times': instance.times,
      'status': instance.status,
    };
