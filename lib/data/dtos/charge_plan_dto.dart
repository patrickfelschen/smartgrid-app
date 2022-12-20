import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_time_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargePlanDTO {
  final int id;
  final DeviceEntity device;
  final ChargeRequestEntity request;
  final double co2ValueSmart;
  final double co2ValueNotSmart;
  final List<ChargePlanTimeEntity> times;
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
      device: map["device"],
      request: map["request"],
      co2ValueSmart: map["co2ValueSmart"],
      co2ValueNotSmart: map["co2ValueNotSmart"],
      times: map["times"],
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
      device: dto.device,
      request: dto.request,
      co2ValueSmart: dto.co2ValueSmart,
      co2ValueNotSmart: dto.co2ValueNotSmart,
      times: dto.times,
      status: dto.status,
    );
  }
}
