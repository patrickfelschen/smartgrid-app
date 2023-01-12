import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/models/device_creation_dto.dart';
import 'package:smartgrid/data/models/device_update_dto.dart';
import 'package:smartgrid/data/repositories/customer_repository.dart';
import 'package:smartgrid/data/repositories/device_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/data/repositories/test/test_device_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository_interface.dart';
import 'package:smartgrid/domain/repositories/device_repository_interface.dart';
import 'package:smartgrid/utils/constants.dart';

final deviceServiceProvider = Provider<DeviceService>((ref) {
  return DeviceService(ref);
});

class DeviceService {
  DeviceService(this.ref);

  final Ref ref;

  final Provider<DeviceRepositoryInterface> _deviceRepository =
      Constants.testMode
          ? testDeviceRepositoryProvider
          : deviceRepositoryProvider;

  final Provider<AuthRepositoryInterface> _authRepository = Constants.testMode
      ? testCustomerRepositoryProvider
      : customerRepositoryProvider;

  Future<List<DeviceEntity>> getAllDevices() async {
    final CustomerEntity? customer =
        await ref.read(_authRepository).getCurrentUser();
    List<DeviceEntity> devices =
        await ref.read(_deviceRepository).getAllDevices(customer!.id);
    return devices;
  }

  Future<DeviceEntity> updateDevice(
    int deviceId,
    DeviceUpdateDTO updateDTO,
  ) async {
    final CustomerEntity? customer =
        await ref.read(_authRepository).getCurrentUser();

    DeviceEntity deviceEntity = await ref.read(_deviceRepository).updateDevice(
          customer!.id,
          deviceId,
          updateDTO.description,
          updateDTO.maxPower,
        );
    return deviceEntity;
  }

  Future<DeviceEntity> createDevice(
    int deviceId,
    DeviceCreationDTO creationDTO,
  ) async {
    final CustomerEntity? customer =
        await ref.read(_authRepository).getCurrentUser();

    DeviceEntity deviceEntity = await ref.read(_deviceRepository).createDevice(
          customer!.id,
          deviceId,
          creationDTO.description,
          creationDTO.maxPower,
        );
    return deviceEntity;
  }
}
