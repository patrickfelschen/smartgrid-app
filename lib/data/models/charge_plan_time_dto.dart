import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/charge_plan_time_entity.dart';

part 'charge_plan_time_dto.freezed.dart';
part 'charge_plan_time_dto.g.dart';

@freezed
class ChargePlanTimeDTO with _$ChargePlanTimeDTO {
  factory ChargePlanTimeDTO({
    required DateTime time,
    required double power,
    required double gCO2eqPerkWh,
    required double powerGridCapacity,
  }) = _ChargePlanTimeDTO;

  static ChargePlanTimeEntity fromDTO(ChargePlanTimeDTO dto) =>
      ChargePlanTimeEntity(
        time: dto.time,
        power: dto.power,
        gCO2eqPerkWh: dto.gCO2eqPerkWh,
        powerGridCapacity: dto.powerGridCapacity,
      );

  factory ChargePlanTimeDTO.fromJson(Map<String, dynamic> json) =>
      _$ChargePlanTimeDTOFromJson(json);
}

/*
class ChargePlanTimeDTO {
  final DateTime time;
  final double power;
  // grams of carbon dioxide equivalent per kilowatt-hour of electricity
  final double gCO2eqPerkWh;
  final double powerGridCapacity;

  ChargePlanTimeDTO({
    required this.time,
    required this.power,
    required this.gCO2eqPerkWh,
    required this.powerGridCapacity,
  });

  factory ChargePlanTimeDTO.fromMap(Map<String, dynamic> map) {
    return ChargePlanTimeDTO(
      time: DateTime.parse(map["time"]),
      power: map["power"],
      gCO2eqPerkWh: map["gCO2eqPerkWh"],
      powerGridCapacity: map["powerGridCapacity"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "time": time.toIso8601String(),
      "power": power,
      "gCO2eqPerkWh": gCO2eqPerkWh,
      "powerGridCapacity": powerGridCapacity,
    };
  }

  static ChargePlanTimeEntity fromDTO(ChargePlanTimeDTO dto) {
    return ChargePlanTimeEntity(
      time: dto.time,
      power: dto.power,
      gCO2eqPerkWh: dto.gCO2eqPerkWh,
      powerGridCapacity: dto.powerGridCapacity,
    );
  }
}
*/