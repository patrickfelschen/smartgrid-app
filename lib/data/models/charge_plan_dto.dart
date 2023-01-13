import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/data/models/charge_plan_time_dto.dart';
import 'package:smartgrid/data/models/charge_request_dto.dart';
import 'package:smartgrid/data/models/device_dto.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

part 'charge_plan_dto.freezed.dart';
part 'charge_plan_dto.g.dart';

@freezed
class ChargePlanDTO with _$ChargePlanDTO {
  factory ChargePlanDTO({
    required int id,
    required DeviceDTO device,
    required ChargeRequestDTO request,
    required double co2ValueSmart,
    required double co2ValueNotSmart,
    required List<ChargePlanTimeDTO> times,
    required String status,
  }) = _ChargePlanDTO;

  static ChargePlanEntity fromDTO(ChargePlanDTO dto) => ChargePlanEntity(
        id: dto.id,
        device: DeviceDTO.fromDTO(dto.device),
        request: ChargeRequestDTO.fromDTO(dto.request),
        co2ValueSmart: dto.co2ValueSmart,
        co2ValueNotSmart: dto.co2ValueNotSmart,
        times:
            dto.times.map((time) => ChargePlanTimeDTO.fromDTO(time)).toList(),
        status: dto.status,
      );

  factory ChargePlanDTO.fromJson(Map<String, dynamic> json) =>
      _$ChargePlanDTOFromJson(json);
}
