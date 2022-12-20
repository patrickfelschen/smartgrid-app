import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';
import 'package:smartgrid/domain/repositories/charge_repository_interface.dart';

class TestChargeRepository implements ChargeRepositoryInterface {
  final Map<int, ChargeRequestEntity> requests;
  final Map<int, ChargePlanEntity> plans;

  TestChargeRepository({
    required this.requests,
    required this.plans,
  });

  @override
  Future<ChargeRequestEntity> createChargeRequest(
    int customerId,
    int deviceId,
    double maxRequiredPower,
    double requiredCapacity,
    DateTime deadline,
  ) async {
    ChargeRequestEntity entity = ChargeRequestEntity(
      id: 4000,
      maxRequiredPower: maxRequiredPower,
      requiredCapacity: requiredCapacity,
      deadline: deadline,
    );
    requests.addAll({4000: entity});
    await Future.delayed(const Duration(seconds: 1));
    return entity;
  }

  @override
  Future<List<ChargePlanEntity>> getAllChargePlans(int customerId) async {
    await Future.delayed(const Duration(seconds: 1));
    return plans.values.toList();
  }

  @override
  Future<ChargePlanEntity> getChargePlan(
    int customerId,
    int chargePlanId,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return plans[chargePlanId]!;
  }
}

final testChargeRepositoryProvider = Provider<ChargeRepositoryInterface>((ref) {
  final chargePlanRepository = TestChargeRepository(
    requests: {},
    plans: {
      5000: ChargePlanEntity(
        id: 5000,
        device: const DeviceEntity(
          id: 3000,
          description: "E-Auto Ladegerät",
          maxPower: 30.5,
        ),
        request: ChargeRequestEntity(
          id: 4000,
          maxRequiredPower: 25.0,
          requiredCapacity: 11.0,
          deadline: DateTime(2023),
        ),
        co2ValueSmart: 100.22,
        co2ValueNotSmart: 300.43,
        status: "active",
        times: [],
      )
    },
  );
  return chargePlanRepository;
});
