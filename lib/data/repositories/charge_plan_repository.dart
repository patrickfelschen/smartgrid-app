import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/data/dtos/charge_request_dto.dart';
import 'package:smartgrid/data/helpers/http_request_helper.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/domain/entities/charge_plan_time_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/repositories/charge_plan_repository_interface.dart';

class ChargePlanRepository implements ChargePlanRepositoryInterface {
  ChargePlanRepository({
    required this.api,
    required this.requestHelper,
  });

  final SmartGridApi api;
  final HttpRequestHelper requestHelper;

  @override
  Future<ChargeRequestEntity> createChargeRequest(
    int customerId,
    int deviceId,
    double maxRequiredPower,
    double requiredCapacity,
    DateTime deadline,
  ) async {
    ChargeRequestCreationDTO creationDto = ChargeRequestCreationDTO(
      maxRequiredPower: maxRequiredPower,
      requiredCapacity: requiredCapacity,
      deadline: deadline,
    );

    ChargeRequestDTO dto = await requestHelper.sendRequest(
      uri: api.chargeRequests(customerId, deviceId),
      method: HttpMethod.post,
      body: creationDto.toMap(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return ChargeRequestDTO.fromMap(data);
        }
        throw Exception(data);
      },
    );

    return ChargeRequestDTO.fromDTO(dto);
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
  final chargePlanRepository = ChargePlanRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  return chargePlanRepository;
});
