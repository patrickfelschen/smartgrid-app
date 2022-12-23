import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

part 'charge_request_creation_controller.freezed.dart';

class ChargeRequestCreationController
    extends StateNotifier<ChargeRequestCreationState> {
  ChargeRequestCreationController({
    required this.chargePlanService,
    required this.deviceService,
  }) : super(ChargeRequestCreationState()) {
    initialize();
  }

  final ChargePlanService chargePlanService;
  final DeviceService deviceService;

  Future<void> initialize() async {
    state = state.copyWith(status: StateStatus.loading);
    List<DeviceEntity> devices = await deviceService.getAllDevices();
    state = state.copyWith(
      status: StateStatus.initial,
      devices: devices,
      selectedDevice: devices.first,
      deadline: DateTime.now(),
    );
  }

  Future<void> createChargeRequest(
    ChargeRequestCreationDTO chargeRequestCreationDTO,
  ) async {
    print("ChargeRequestCreationController::createChargeRequest");
    print("ChargeRequestDTO: $chargeRequestCreationDTO");
    state = state.copyWith(status: StateStatus.loading);
    print("ChargeRequestCreationState::Loading");
    ChargeRequestEntity chargeRequest =
        await chargePlanService.createChargeRequest(
      state.selectedDevice!.id,
      chargeRequestCreationDTO,
    );
    if (chargeRequest != null) {
      state = state.copyWith(
        status: StateStatus.success,
      );

      print("ChargeRequestCreationState::Success");
    } else {
      state = state.copyWith(
        status: StateStatus.failure,
        error: "Could not create charge request",
      );
      print("ChargeRequestCreationState::Error");
    }
  }

  void selectDevice(DeviceEntity device) {
    state = state.copyWith(selectedDevice: device);
  }

  void selectDeadline(DateTime deadline) {
    state = state.copyWith(deadline: deadline);
  }

  void setMaxRequiredPower(double maxRequiredPower) {
    state = state.copyWith(maxRequiredPower: maxRequiredPower);
  }

  void setRequiredCapacity(double requiredCapacity) {
    state = state.copyWith(requiredCapacity: requiredCapacity);
  }
}

@freezed
class ChargeRequestCreationState with _$ChargeRequestCreationState {
  factory ChargeRequestCreationState({
    @Default(StateStatus.initial) StateStatus status,
    @Default("") String? error,
    @Default([]) List<DeviceEntity> devices,
    @Default(null) DeviceEntity? selectedDevice,
    @Default(0) double maxRequiredPower,
    @Default(0) double requiredCapacity,
    @Default(null) DateTime? deadline,
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
