import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/charge_plan_service.dart';
import 'package:smartgrid/app/services/device_service.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestCreationController extends StateNotifier<AsyncValue<void>> {
  ChargeRequestCreationController({
    required this.chargePlanService,
    required this.deviceService,
  }) : super(const AsyncData<void>(null)) {
    getAllDevices();
  }

  final ChargePlanService chargePlanService;
  final DeviceService deviceService;

  DeviceEntity? _selectedDevice;

  Future<void> createChargeRequest(
    ChargeRequestCreationDTO chargeRequestCreationDTO,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<ChargeRequestEntity>(
      () => chargePlanService.createChargeRequest(
        _selectedDevice!.id,
        chargeRequestCreationDTO,
      ),
    );
  }

  void selectDevice(DeviceEntity deviceEntity) {
    _selectedDevice = deviceEntity;
  }

  Future<void> getAllDevices() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => deviceService.getAllDevices(),
    );
  }
}

final chargeRequestCreationControllerProvider = StateNotifierProvider
    .autoDispose<ChargeRequestCreationController, AsyncValue<void>>((ref) {
  return ChargeRequestCreationController(
    chargePlanService: ref.watch(chargePlanServiceProvider),
    deviceService: ref.watch(deviceServiceProvider),
  );
});
