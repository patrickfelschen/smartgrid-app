import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/models/device_creation_dto.dart';
import 'package:smartgrid/data/models/device_update_dto.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

part 'device_profile_controller.freezed.dart';

final deviceControllerProvider =
    StateNotifierProvider.autoDispose<DeviceController, DeviceProfileState>(
        (ref) {
  return DeviceController(
    deviceService: ref.watch(deviceServiceProvider),
  );
});

@freezed
class DeviceProfileState with _$DeviceProfileState {
  const factory DeviceProfileState({
    @Default(null) List<DeviceEntity>? devices,
    @Default(null) DeviceEntity? selectedDevice,
    @Default(StateStatus.initial) StateStatus status,
    @Default(null) String? error,
  }) = _DeviceProfileState;
}

class DeviceController extends StateNotifier<DeviceProfileState> {
  DeviceController({required this.deviceService})
      : super(const DeviceProfileState()) {
    loadAllDevices();
  }

  final DeviceService deviceService;

  Future<void> loadAllDevices() async {
    state = state.copyWith(status: StateStatus.loading);
    List<DeviceEntity> devices = await deviceService.getAllDevices();
    //DeviceEntity selectedDevice = devices.first;
    state = state.copyWith(
      devices: devices,
      //selectedDevice: selectedDevice,
      status: StateStatus.initial,
    );
  }

  Future<void> updateDevice(int deviceId, DeviceUpdateDTO updateDTO) async {
    DeviceEntity de = await deviceService.updateDevice(deviceId, updateDTO);
    state = state.copyWith(
      selectedDevice: de,
      status: StateStatus.initial,
    );
    loadAllDevices();
  }

  Future<void> createDevice(int deviceId, DeviceCreationDTO creationDTO) async {
    DeviceEntity de = await deviceService.createDevice(deviceId, creationDTO);
    state = state.copyWith(
      selectedDevice: de,
      status: StateStatus.initial,
    );
  }

  void selectDevice(DeviceEntity? selectedDevice) {
    state = state.copyWith(selectedDevice: selectedDevice);
  }
}
