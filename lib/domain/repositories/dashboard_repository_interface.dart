import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

abstract class DashboardRepositoryInterface {
  Future<DashboardInfoEntity> getDashboardInfo(int? id);
}
