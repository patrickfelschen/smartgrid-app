import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/helpers/http_request_helper.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/data/models/charge_plan_dto.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';
import 'package:smartgrid/data/models/charge_request_dto.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/repositories/charge_repository_interface.dart';

class ChargeRepository implements ChargeRepositoryInterface {
  ChargeRepository({
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
      body: creationDto.toJson(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return ChargeRequestDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );

    return ChargeRequestDTO.fromDTO(dto);
  }

  @override
  Future<List<ChargePlanEntity>> getAllChargePlans(int customerId) async {
    List<ChargePlanDTO> dtos = await requestHelper.sendRequest(
      uri: api.chargePlans(customerId),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          List<ChargePlanDTO> dtos =
              (data as List).map((e) => ChargePlanDTO.fromJson(e)).toList();
          return dtos;
        }
        throw Exception(data);
      },
    );
    List<ChargePlanEntity> plans =
        dtos.map((e) => ChargePlanDTO.fromDTO(e)).toList();
    return plans;
  }

  @override
  Future<ChargePlanEntity> getChargePlan(
    int customerId,
    int chargePlanId,
  ) async {
    ChargePlanDTO dto = await requestHelper.sendRequest(
      uri: api.chargePlan(customerId, chargePlanId),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return ChargePlanDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );
    return ChargePlanDTO.fromDTO(dto);
  }

  @override
  Future<ChargePlanEntity> updateChargePlan(
    int customerId,
    int chargePlanId,
    String status,
  ) {
    // TODO: implement updateChargePlan
    throw UnimplementedError();
  }
}

final chargeRepositoryProvider = Provider<ChargeRepositoryInterface>((ref) {
  final chargePlanRepository = ChargeRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  return chargePlanRepository;
});
