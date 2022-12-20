import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/data/dtos/charge_request_dto.dart';
import 'package:smartgrid/domain/entities/charge_plan_time_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/repositories/charge_plan_repository_interface.dart';

class ChargePlanRepository implements ChargePlanRepositoryInterface {
  @override
  Future<ChargePlanEntity> createChargePlan(int id, DeviceEntity device,
      double requiredPower, double capacity, DateTime deadline) async {
    ChargeRequestCreationDTO chargeRequestCreationDTO =
        ChargeRequestCreationDTO(
      id: id,
      deviceEntity: device,
      requiredPower: requiredPower,
      capacity: capacity,
      deadline: deadline,
    );

    Future.delayed(const Duration(seconds: 1));

    ChargeRequestDTO chargeRequestDTO =
        ChargeRequestDTO.fromMap(chargeRequestCreationDTO.toMap());
    ChargeRequestEntity chargeRequestEntity =
        ChargeRequestDTO.fromDTO(chargeRequestDTO);

    return ChargePlanEntity(
      id: id,
      device: device,
      request: chargeRequestEntity,
      co2ValueSmart: 200,
      co2ValueNotSmart: 250,
      times: List<ChargePlanTimeEntity>.empty(),
      status: "Active",
    );
  }

  @override
  Future<List<ChargePlanEntity>> getAllChargePlans() {
    // TODO: implement getAllChargePlans
    throw UnimplementedError();
  }

  @override
  Future<ChargePlanEntity> getChargePlan(int id) {
    // TODO: implement getChargePlan
    throw UnimplementedError();
  }
}

final chargePlanRepositoryProvider = Provider<ChargePlanRepository>((ref) {
  final chargePlanRepository = ChargePlanRepository();
  return chargePlanRepository;
});
