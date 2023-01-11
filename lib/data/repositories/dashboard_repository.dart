import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/data/helpers/http_request_helper.dart';
import 'package:smartgrid/data/helpers/smart_grid_api.dart';
import 'package:smartgrid/data/models/dashboard_info_dto.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import 'package:smartgrid/domain/repositories/dashboard_repository_interface.dart';

final dashboardRepositoryProvider =
    Provider<DashboardRepositoryInterface>((ref) {
  final DashboardRepository dashboardRepository = DashboardRepository(
    api: SmartGridApi(),
    requestHelper: HttpRequestHelper(),
  );
  return dashboardRepository;
});

class DashboardRepository implements DashboardRepositoryInterface {
  DashboardRepository({
    required this.api,
    required this.requestHelper,
  });

  final SmartGridApi api;
  final HttpRequestHelper requestHelper;

  @override
  Future<DashboardInfoEntity> getDashboardInfo(int customerId) async {
    DashboardInfoDTO dto = await requestHelper.sendRequest(
      uri: api.dashboard(customerId),
      method: HttpMethod.get,
      builder: (status, data) {
        if (status == HttpStatusCode.ok) {
          return DashboardInfoDTO.fromJson(data);
        }
        throw Exception(data);
      },
    );
    return DashboardInfoDTO.fromDTO(dto);
  }
}
