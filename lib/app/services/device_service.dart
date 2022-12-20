import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/device_update_dto.dart';
import 'package:smartgrid/data/repositories/device_repository.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceService {
  DeviceService(this.ref);

  final Ref ref;

  Future<List<DeviceEntity>> getAllDevices() async {
    List<DeviceEntity> devices =
        await ref.read(deviceRepositoryProvider).getAllDevices();
    return devices;
  }

  Future<DeviceEntity> updateDevice(
      int deviceId, DeviceUpdateDTO updateDTO) async {
    DeviceEntity deviceEntity = await ref
        .read(deviceRepositoryProvider)
        .updateDevice(deviceId, updateDTO.description, updateDTO.maxPower);
    return deviceEntity;
  }
}

final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService(ref);
});