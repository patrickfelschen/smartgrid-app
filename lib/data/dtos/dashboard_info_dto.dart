import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';

class DashboardInfoDTO {
  final double totalCo2ValueSmart;
  final double totalCo2ValueNotSmart;

  DashboardInfoDTO({
    required this.totalCo2ValueSmart,
    required this.totalCo2ValueNotSmart,
  });

  factory DashboardInfoDTO.fromMap(Map<String, dynamic> map) {
    return DashboardInfoDTO(
      totalCo2ValueSmart: map["totalCo2ValueSmart"],
      totalCo2ValueNotSmart: map["totalCo2ValueNotSmart"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "totalCo2ValueSmart": totalCo2ValueSmart,
      "totalCo2ValueNotSmart": totalCo2ValueNotSmart,
    };
  }

  static DashboardInfoEntity fromDTO(DashboardInfoDTO dto) {
    return DashboardInfoEntity(
      totalCo2ValueSmart: dto.totalCo2ValueSmart,
      totalCo2ValueNotSmart: dto.totalCo2ValueNotSmart,
    );
  }
}
