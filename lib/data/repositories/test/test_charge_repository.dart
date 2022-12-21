import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_plan_dto.dart';
import 'package:smartgrid/data/dtos/charge_request_dto.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/repositories/charge_repository_interface.dart';

import 'package:flutter/services.dart' show rootBundle;

class TestChargeRepository implements ChargeRepositoryInterface {
  Future<Map<String, dynamic>> _loadJson(String jsonFile) async {
    String data = await rootBundle.loadString(
      'assets/json/test/$jsonFile',
    );
    Map<String, dynamic> jsonData = json.decode(data);
    return jsonData;
  }

  @override
  Future<ChargeRequestEntity> createChargeRequest(
    int customerId,
    int deviceId,
    double maxRequiredPower,
    double requiredCapacity,
    DateTime deadline,
  ) async {
    Map<String, dynamic> jsonData = await _loadJson(
      "charge-requests_post_res.json",
    );
    print(jsonData);
    ChargeRequestDTO dto = ChargeRequestDTO.fromMap(jsonData);
    return ChargeRequestDTO.fromDTO(dto);
  }

  @override
  Future<List<ChargePlanEntity>> getAllChargePlans(int customerId) async {
    Map<String, dynamic> jsonData = await _loadJson(
      "charge-plans_get_res.json",
    );
    List<ChargePlanDTO> dtos =
        (jsonData as List).map((e) => ChargePlanDTO.fromMap(e)).toList();

    List<ChargePlanEntity> entities =
        dtos.map((e) => ChargePlanDTO.fromDTO(e)).toList();
    return entities;
  }

  @override
  Future<ChargePlanEntity> getChargePlan(
    int customerId,
    int chargePlanId,
  ) async {
    Map<String, dynamic> jsonData = await _loadJson(
      "charge-plans_get_id_res.json",
    );
    ChargePlanDTO dto = ChargePlanDTO.fromMap(jsonData);
    return ChargePlanDTO.fromDTO(dto);
  }
}

final testChargeRepositoryProvider = Provider<ChargeRepositoryInterface>((ref) {
  final chargePlanRepository = TestChargeRepository();
  return chargePlanRepository;
});
