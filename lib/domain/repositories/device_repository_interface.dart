import 'package:smartgrid/domain/entities/device_entity.dart';

abstract class DeviceRepositoryInterface {
  Future<List<DeviceEntity>> getAllDevices(int customerId);

  Future<DeviceEntity> createDevice(
    int customerId,
    int deviceId,
    String description,
    double maxPower,
  );

  Future<DeviceEntity> updateDevice(
    int customerId,
    int deviceId,
    String description,
    double maxPower,
  );
}
