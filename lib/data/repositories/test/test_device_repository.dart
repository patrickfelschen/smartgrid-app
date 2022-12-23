import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/models/device_dto.dart';
import 'package:smartgrid/device/utils/json_loader_helper.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/device_repository_interface.dart';

class TestDeviceRepository implements DeviceRepositoryInterface {
  final JsonLoaderHelper jsonLoaderHelper;

  TestDeviceRepository({
    required this.jsonLoaderHelper,
  });

  @override
  Future<List<DeviceEntity>> getAllDevices(int? customerId) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "devices_get_res.json",
    );
    List<DeviceDTO> dtos =
        (jsonData as List).map((e) => DeviceDTO.fromJson(e)).toList();

    List<DeviceEntity> entities =
        dtos.map((e) => DeviceDTO.fromDTO(e)).toList();
    return entities;
  }

  @override
  Future<DeviceEntity> updateDevice(
    int deviceId,
    String description,
    double maxPower,
  ) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "devices_update_res.json",
    );
    DeviceDTO dto = DeviceDTO.fromJson(jsonData);
    return DeviceDTO.fromDTO(dto);
  }
}

final testDeviceRepositoryProvider = Provider<DeviceRepositoryInterface>((ref) {
  final deviceRepository = TestDeviceRepository(
    jsonLoaderHelper: JsonLoaderHelper(),
  );
  return deviceRepository;
});
