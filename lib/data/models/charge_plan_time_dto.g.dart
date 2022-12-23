// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_plan_time_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChargePlanTimeDTO _$$_ChargePlanTimeDTOFromJson(Map<String, dynamic> json) =>
    _$_ChargePlanTimeDTO(
      time: DateTime.parse(json['time'] as String),
      power: (json['power'] as num).toDouble(),
      gCO2eqPerkWh: (json['gCO2eqPerkWh'] as num).toDouble(),
      powerGridCapacity: (json['powerGridCapacity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ChargePlanTimeDTOToJson(
        _$_ChargePlanTimeDTO instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'power': instance.power,
      'gCO2eqPerkWh': instance.gCO2eqPerkWh,
      'powerGridCapacity': instance.powerGridCapacity,
    };
