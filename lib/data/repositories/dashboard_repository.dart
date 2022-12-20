import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';

class DashboardRepository implements DashboardRepositoryInterface {
  @override
  Future<DashboardInfoEntity> getDashboardInfo(int? id) {
    Future.delayed(const Duration(seconds: 1));
    return Future.value(
      DashboardInfoEntity(totalCo2ValueNotSmart: 280, totalCo2ValueSmart: 170),
    );
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final DashboardRepository dashboardRepository = DashboardRepository();
  return dashboardRepository;
});
