import 'package:smartgrid/domain/entities/device_entity.dart';

abstract class DeviceRepositoryInterface {
  Future<List<DeviceEntity>> getAllDevices();
  Future<DeviceEntity> updateDevice(
      int deviceId, String description, double maxPower);
}
