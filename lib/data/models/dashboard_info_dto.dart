import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_info_dto.freezed.dart';
part 'dashboard_info_dto.g.dart';

@freezed
class DashboardInfoDTO with _$DashboardInfoDTO {
  factory DashboardInfoDTO({
    required double totalCo2ValueSmart,
    required double totalCo2ValueNotSmart,
  }) = _DashboardInfoDTO;

  static DashboardInfoEntity fromDTO(DashboardInfoDTO dto) {
    return DashboardInfoEntity(
      totalCo2ValueSmart: dto.totalCo2ValueSmart,
      totalCo2ValueNotSmart: dto.totalCo2ValueNotSmart,
    );
  }

  factory DashboardInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$DashboardInfoDTOFromJson(json);
}
