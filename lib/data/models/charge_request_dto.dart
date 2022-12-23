import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/charge_request_entity.dart';

part 'charge_request_dto.freezed.dart';
part 'charge_request_dto.g.dart';

@unfreezed
class ChargeRequestDTO with _$ChargeRequestDTO {
  factory ChargeRequestDTO({
    required int id,
    required double maxRequiredPower,
    required double requiredCapacity,
    required DateTime deadline,
  }) = _ChargeRequestDTO;

  static ChargeRequestEntity fromDTO(ChargeRequestDTO dto) =>
      ChargeRequestEntity(
        id: dto.id,
        maxRequiredPower: dto.maxRequiredPower,
        requiredCapacity: dto.requiredCapacity,
        deadline: dto.deadline,
      );

  factory ChargeRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ChargeRequestDTOFromJson(json);
}
