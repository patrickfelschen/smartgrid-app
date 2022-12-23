import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/models/device_update_dto.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

part 'device_update_controller.freezed.dart';

@freezed
class DeviceUpdateState with _$DeviceUpdateState {
  const factory DeviceUpdateState({
    @Default(null) List<DeviceEntity>? devices,
    @Default(null) DeviceEntity? selectedDevice,
    @Default(StateStatus.initial) StateStatus status,
    @Default(null) String? error,
  }) = _DeviceUpdateState;
}

class DeviceUpdateController extends StateNotifier<DeviceUpdateState> {
  DeviceUpdateController({required this.deviceService})
      : super(const DeviceUpdateState()) {
    initialize();
  }

  final DeviceService deviceService;

  Future<void> initialize() async {
    state = state.copyWith(status: StateStatus.loading);
    List<DeviceEntity> devices = await deviceService.getAllDevices();
    DeviceEntity selectedDevice = devices.first;
    state = state.copyWith(
      devices: devices,
      selectedDevice: selectedDevice,
      status: StateStatus.initial,
    );
  }

  Future<void> updateDevice(int deviceId, DeviceUpdateDTO updateDTO) async {
    //state = const AsyncLoading<void>();
    //state = await AsyncValue.guard<void>(
    //  () => deviceService.updateDevice(deviceId, updateDTO),
    //);
  }

  void selectDevice(DeviceEntity selectedDevice) {
    state = state.copyWith(selectedDevice: selectedDevice);
  }
}

final deviceControllerProvider = StateNotifierProvider.autoDispose<
    DeviceUpdateController, DeviceUpdateState>((ref) {
  return DeviceUpdateController(
    deviceService: ref.watch(deviceServiceProvider),
  );
});
