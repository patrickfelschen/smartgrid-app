import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';

class DashboardRepository implements DashboardRepositoryInterface {
  @override
  Future<DashboardInfoEntity> getDashboardInfo(int id) {
    // TODO: implement getDashboardInfo
    throw UnimplementedError();
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final DashboardRepository dashboardRepository = DashboardRepository();
  return dashboardRepository;
});
