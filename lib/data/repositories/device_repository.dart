import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/device_repository_interface.dart';

class DeviceRepository implements DeviceRepositoryInterface {
  @override
  Future<DeviceEntity> updateDevice(
      int deviceId, String description, double maxPower) {
    // TODO: implement editDevice
    throw UnimplementedError();
  }

  @override
  Future<List<DeviceEntity>> getAllDevices(int? customerId) {
    // TODO: implement getAllDevices
    throw UnimplementedError();
  }

  @override
  Future<DeviceEntity> createDevice(
      int deviceId, String description, double maxPower) {
    // TODO: implement createDevice
    throw UnimplementedError();
  }
}

final deviceRepositoryProvider = Provider<DeviceRepositoryInterface>((ref) {
  final deviceRepository = DeviceRepository();
  return deviceRepository;
});
