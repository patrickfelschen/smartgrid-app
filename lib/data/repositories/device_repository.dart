import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/helpers/http_request_helper.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/data/models/device_creation_dto.dart';
import 'package:smartgrid/data/models/device_dto.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/device_repository_interface.dart';

final deviceRepositoryProvider = Provider<DeviceRepositoryInterface>((ref) {
  final deviceRepository = DeviceRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  return deviceRepository;
});

class DeviceRepository implements DeviceRepositoryInterface {
  DeviceRepository({
    required this.api,
    required this.requestHelper,
  });

  final SmartGridApi api;
  final HttpRequestHelper requestHelper;

  @override
  Future<DeviceEntity> createDevice(
    int customerId,
    int deviceId,
    String description,
    double maxPower,
  ) async {
    DeviceCreationDTO creationDTO = DeviceCreationDTO(
      id: deviceId,
      description: description,
      maxPower: maxPower,
    );

    DeviceDTO dto = await requestHelper.sendRequest(
      uri: api.devices(customerId),
      method: HttpMethod.post,
      body: creationDTO.toJson(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return DeviceDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );

    return DeviceDTO.fromDTO(dto);
  }

  @override
  Future<DeviceEntity> updateDevice(
    int customerId,
    int deviceId,
    String description,
    double maxPower,
  ) async {
    DeviceCreationDTO updateDTO = DeviceCreationDTO(
      id: deviceId,
      description: description,
      maxPower: maxPower,
    );

    DeviceDTO dto = await requestHelper.sendRequest(
      uri: api.device(customerId, deviceId),
      method: HttpMethod.patch,
      body: updateDTO.toJson(),
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return DeviceDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );

    return DeviceDTO.fromDTO(dto);
  }

  @override
  Future<List<DeviceEntity>> getAllDevices(
    int customerId,
  ) async {
    List<DeviceDTO> dtos = await requestHelper.sendRequest(
      uri: api.devices(customerId),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          List<DeviceDTO> dtos =
              (data as List).map((e) => DeviceDTO.fromJson(e)).toList();
          return dtos;
        }
        throw Exception(data);
      },
    );
    List<DeviceEntity> entities =
        dtos.map((e) => DeviceDTO.fromDTO(e)).toList();
    return entities;
  }
}
