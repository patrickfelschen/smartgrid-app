import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

import 'charge_plan_time_entity.dart';

class ChargePlanEntity {
  final int id;
  final DeviceEntity device;
  final ChargeRequestEntity request;
  final double co2ValueSmart;
  final double co2ValueNotSmart;
  final String status;
  final List<ChargePlanTimeEntity> times;

  ChargePlanEntity({
    required this.id,
    required this.device,
    required this.request,
    required this.co2ValueSmart,
    required this.co2ValueNotSmart,
    required this.status,
    required this.times,
  });

  @override
  String toString() {
    return "$id $device $request $co2ValueSmart $co2ValueNotSmart $times $status";
  }
}
