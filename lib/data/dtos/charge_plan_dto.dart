import 'package:smartgrid/data/dtos/charge_plan_time_dto.dart';
import 'package:smartgrid/data/dtos/charge_request_dto.dart';
import 'package:smartgrid/data/dtos/device_dto.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanDTO {
  final int id;
  final DeviceDTO device;
  final ChargeRequestDTO request;
  final double co2ValueSmart;
  final double co2ValueNotSmart;
  final List<ChargePlanTimeDTO> times;
  final String status;

  ChargePlanDTO({
    required this.id,
    required this.device,
    required this.request,
    required this.co2ValueSmart,
    required this.co2ValueNotSmart,
    required this.times,
    required this.status,
  });

  factory ChargePlanDTO.fromMap(Map<String, dynamic> map) {
    return ChargePlanDTO(
      id: map["id"],
      device: DeviceDTO.fromMap(map["device"]),
      request: ChargeRequestDTO.fromMap(map["request"]),
      co2ValueSmart: map["co2ValueSmart"],
      co2ValueNotSmart: map["co2ValueNotSmart"],
      times: (map["times"] as List)
          .map((e) => ChargePlanTimeDTO.fromMap(e))
          .toList(),
      status: map["status"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "device": device,
      "request": request,
      "co2ValueSmart": co2ValueSmart,
      "co2ValueNotSmart": co2ValueNotSmart,
      "times": times,
      "status": status,
    };
  }

  static ChargePlanEntity fromDTO(ChargePlanDTO dto) {
    return ChargePlanEntity(
      id: dto.id,
      device: DeviceDTO.fromDTO(dto.device),
      request: ChargeRequestDTO.fromDTO(dto.request),
      co2ValueSmart: dto.co2ValueSmart,
      co2ValueNotSmart: dto.co2ValueNotSmart,
      times: dto.times.map((e) => ChargePlanTimeDTO.fromDTO(e)).toList(),
      status: dto.status,
    );
  }
}
