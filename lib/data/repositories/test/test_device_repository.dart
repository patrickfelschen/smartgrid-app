import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/device_repository_interface.dart';

class TestDeviceRepository implements DeviceRepositoryInterface {
  final Map<int, DeviceEntity> devices;

  TestDeviceRepository({
    required this.devices,
  });

  @override
  Future<List<DeviceEntity>> getAllDevices(int? customerId) async {
    await Future.delayed(const Duration(seconds: 1));
    return devices.values.toList();
  }

  @override
  Future<DeviceEntity> updateDevice(
      int deviceId, String description, double maxPower) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }
}

final testDeviceRepositoryProvider = Provider<DeviceRepositoryInterface>((ref) {
  final deviceRepository = TestDeviceRepository(devices: {
    1000: const DeviceEntity(
        id: 1000, description: "Test Device 1", maxPower: 500),
    1001: const DeviceEntity(
        id: 1001, description: "Test Device 2", maxPower: 420),
  });
  return deviceRepository;
});
