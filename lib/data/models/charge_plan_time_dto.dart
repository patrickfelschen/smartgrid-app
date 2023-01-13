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
