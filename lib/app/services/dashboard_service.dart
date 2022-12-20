import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/repositories/dashboard_repository.dart';
import 'package:smartgrid/data/repositories/test/test_customer_repository.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

class DashboardService {
  DashboardService(this.ref);

  final Ref ref;

  Future<DashboardInfoEntity> getDashboardInfo() async {
    final CustomerEntity? customer =
        await ref.read(testCustomerRepositoryProvider).getCurrentUser();
    DashboardInfoEntity dashboardInfoEntity = await ref
        .read(dashboardRepositoryProvider)
        .getDashboardInfo(customer?.id);
    return dashboardInfoEntity;
  }
}

final dashboardServiceProvider = Provider<DashboardService>((ref) {
  return DashboardService(ref);
});
