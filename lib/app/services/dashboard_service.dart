import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/repositories/dashboard_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

class DashboardService {
  DashboardService(this.ref);

  final Ref ref;
  final Provider<AuthRepository> _authRepository =
      testCustomerRepositoryProvider;

  Future<DashboardInfoEntity> getDashboardInfo(int id) async {
    DashboardInfoEntity dashboardInfoEntity =
        await ref.read(dashboardRepositoryProvider).getDashboardInfo(id);
    return dashboardInfoEntity;
  }
}

final dashboardServiceProvider = Provider<DashboardService>((ref) {
  return DashboardService(ref);
});
