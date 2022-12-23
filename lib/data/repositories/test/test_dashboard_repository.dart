import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/models/dashboard_info_dto.dart';
import 'package:smartgrid/device/utils/json_loader_helper.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';

class TestDashboardRepository implements DashboardRepositoryInterface {
  final JsonLoaderHelper jsonLoaderHelper;

  TestDashboardRepository({
    required this.jsonLoaderHelper,
  });

  @override
  Future<DashboardInfoEntity> getDashboardInfo(int customerId) async {
    dynamic jsonData = await jsonLoaderHelper.loadJson(
      "dashboard_get_res.json",
    );
    DashboardInfoDTO dto = DashboardInfoDTO.fromJson(jsonData);
    return DashboardInfoDTO.fromDTO(dto);
  }
}

final testDashboardRepositoryProvider =
    Provider<DashboardRepositoryInterface>((ref) {
  final dashboardRepository = TestDashboardRepository(
    jsonLoaderHelper: JsonLoaderHelper(),
  );
  return dashboardRepository;
});
