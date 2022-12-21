import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_plan_dto.dart';
import 'package:smartgrid/data/dtos/charge_request_dto.dart';
import 'package:smartgrid/device/utils/json_loader_helper.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/repositories/charge_repository_interface.dart';

class TestChargeRepository implements ChargeRepositoryInterface {
  final JsonLoaderHelper jsonLoaderHelper;

  TestChargeRepository({
    required this.jsonLoaderHelper,
  });

  @override
  Future<ChargeRequestEntity> createChargeRequest(
    int customerId,
    int deviceId,
    double maxRequiredPower,
    double requiredCapacity,
    DateTime deadline,
  ) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "charge-requests_post_res.json",
    );
    ChargeRequestDTO dto = ChargeRequestDTO.fromMap(jsonData);
    return ChargeRequestDTO.fromDTO(dto);
  }

  @override
  Future<List<ChargePlanEntity>> getAllChargePlans(int customerId) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
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
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "charge-plans_get_id_res.json",
    );
    ChargePlanDTO dto = ChargePlanDTO.fromMap(jsonData);
    return ChargePlanDTO.fromDTO(dto);
  }
}

final testChargeRepositoryProvider = Provider<ChargeRepositoryInterface>((ref) {
  final chargePlanRepository = TestChargeRepository(
    jsonLoaderHelper: JsonLoaderHelper(),
  );
  return chargePlanRepository;
});
