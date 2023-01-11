import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/repositories/customer_repository.dart';
import 'package:smartgrid/data/repositories/dashboard_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/data/repositories/test/test_dashboard_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository_interface.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';
import 'package:smartgrid/utils/constants.dart';

final dashboardServiceProvider = Provider<DashboardService>((ref) {
  return DashboardService(ref);
});

class DashboardService {
  DashboardService(this.ref);

  final Ref ref;

  final Provider<DashboardRepositoryInterface> _dashboardRepository =
      Constants.testMode
          ? testDashboardRepositoryProvider
          : dashboardRepositoryProvider;

  final Provider<AuthRepositoryInterface> _authRepository = Constants.testMode
      ? testCustomerRepositoryProvider
      : customerRepositoryProvider;

  Future<DashboardInfoEntity> getDashboardInfo() async {
    final CustomerEntity? customer =
        await ref.read(_authRepository).getCurrentUser();
    DashboardInfoEntity dashboardInfoEntity =
        await ref.read(_dashboardRepository).getDashboardInfo(customer!.id);
    return dashboardInfoEntity;
  }
}
