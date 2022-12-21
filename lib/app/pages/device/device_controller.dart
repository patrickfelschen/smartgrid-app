import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/dtos/device_update_dto.dart';

class DeviceController extends StateNotifier<AsyncValue<void>> {
  DeviceController({required this.deviceService})
      : super(const AsyncData<void>(null)) {
    getAllDevices();
  }

  final DeviceService deviceService;

  Future<void> getAllDevices() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => deviceService.getAllDevices(),
    );
  }

  Future<void> updateDevice(int deviceId, DeviceUpdateDTO updateDTO) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => deviceService.updateDevice(deviceId, updateDTO),
    );
  }
}

final deviceControllerProvider =
    StateNotifierProvider.autoDispose<DeviceController, AsyncValue<void>>(
        (ref) {
  return DeviceController(
    deviceService: ref.watch(deviceServiceProvider),
  );
});
