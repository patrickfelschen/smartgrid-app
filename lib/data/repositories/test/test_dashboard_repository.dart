import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/device/utils/json_loader_helper.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';

class TestDashboardRepository implements DashboardRepositoryInterface {
  final JsonLoaderHelper jsonLoaderHelper;

  TestDashboardRepository({
    required this.jsonLoaderHelper,
  });

  @override
  Future<DashboardInfoEntity> getDashboardInfo(int? id) {
    Future.delayed(const Duration(seconds: 1));
    return Future.value(
      DashboardInfoEntity(totalCo2ValueNotSmart: 280, totalCo2ValueSmart: 170),
    );
  }
}

final testDashboardRepositoryProvider =
    Provider<DashboardRepositoryInterface>((ref) {
  final dashboardRepository = TestDashboardRepository(
    jsonLoaderHelper: JsonLoaderHelper(),
  );
  return dashboardRepository;
});
