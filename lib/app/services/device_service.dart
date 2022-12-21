import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/dtos/device_update_dto.dart';
import 'package:smartgrid/data/repositories/device_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/data/repositories/test/test_device_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceService {
  DeviceService(this.ref);

  final Ref ref;

  Future<List<DeviceEntity>> getAllDevices() async {
    final CustomerEntity? customer =
        await ref.read(testCustomerRepositoryProvider).getCurrentUser();
    List<DeviceEntity> devices = await ref
        .read(testDeviceRepositoryProvider)
        .getAllDevices(customer!.id);
    return devices;
  }

  Future<DeviceEntity> updateDevice(
    int deviceId,
    DeviceUpdateDTO updateDTO,
  ) async {
    DeviceEntity deviceEntity =
        await ref.read(deviceRepositoryProvider).updateDevice(
              deviceId,
              updateDTO.description,
              updateDTO.maxPower,
            );
    return deviceEntity;
  }
}

final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService(ref);
});
