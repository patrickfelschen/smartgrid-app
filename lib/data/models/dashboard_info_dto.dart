import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

part 'dashboard_info_dto.freezed.dart';
part 'dashboard_info_dto.g.dart';

@freezed
class DashboardInfoDTO with _$DashboardInfoDTO {
  factory DashboardInfoDTO({
    required double totalCo2SavingValue,
  }) = _DashboardInfoDTO;

  static DashboardInfoEntity fromDTO(DashboardInfoDTO dto) {
    return DashboardInfoEntity(
      totalCo2SavingValue: dto.totalCo2SavingValue,
    );
  }

  factory DashboardInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$DashboardInfoDTOFromJson(json);
}
