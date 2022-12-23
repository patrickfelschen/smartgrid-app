import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

part 'charge_request_creation_controller.freezed.dart';

class ChargeRequestCreationController
    extends StateNotifier<ChargeRequestCreationState> {
  ChargeRequestCreationController({
    required this.chargePlanService,
    required this.deviceService,
  }) : super(ChargeRequestCreationState()) {
    getAllDevices();
  }

  final ChargePlanService chargePlanService;
  final DeviceService deviceService;

  Future<void> createChargeRequest(
    ChargeRequestCreationDTO chargeRequestCreationDTO,
  ) async {
    state = state.copyWith(status: StateStatus.loading);
    await AsyncValue.guard<ChargeRequestEntity>(
      () => chargePlanService.createChargeRequest(
        state.selectedDevice!.id,
        chargeRequestCreationDTO,
      ),
    );
    state = state.copyWith(status: StateStatus.success);
  }

  Future<void> getAllDevices() async {
    print("ChargeRequestCreationController::getAllDevices");
    state = state.copyWith(status: StateStatus.loading);
    print("ChargeRequestCreationState::Loading");
    List<DeviceEntity> devices = await deviceService.getAllDevices();
    if (devices.isNotEmpty) {
      state = state.copyWith(
        status: StateStatus.success,
        devices: devices,
      );
      print("ChargeRequestCreationState::Success");
    } else {
      state = state.copyWith(
          status: StateStatus.failure, error: "No devices found");
      print("ChargeRequestCreationState::Error");
    }
  }

  void selectDevice(DeviceEntity device) {
    state = state.copyWith(selectedDevice: device);
  }

  void selectDeadline(DateTime deadline) {
    state = state.copyWith(selectedDeadline: deadline);
  }
}

@freezed
class ChargeRequestCreationState with _$ChargeRequestCreationState {
  factory ChargeRequestCreationState({
    @Default(StateStatus.initial) StateStatus status,
    @Default("") String? error,
    @Default([]) List<DeviceEntity> devices,
    @Default(null) ChargeRequestCreationDTO? chargeRequestCreationDTO,
  }) = _ChargeRequestCreationState;

  ChargeRequestCreationState._();
}

final chargeRequestCreationControllerProvider =
    StateNotifierProvider.autoDispose<ChargeRequestCreationController,
        ChargeRequestCreationState>((ref) {
  return ChargeRequestCreationController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
    deviceService: ref.watch(deviceServiceProvider),
  );
});
