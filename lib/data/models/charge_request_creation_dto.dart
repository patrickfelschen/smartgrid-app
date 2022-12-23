import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_request_creation_dto.freezed.dart';
part 'charge_request_creation_dto.g.dart';

@unfreezed
class ChargeRequestCreationDTO with _$ChargeRequestCreationDTO {
  factory ChargeRequestCreationDTO({
    required double maxRequiredPower,
    required double requiredCapacity,
    required DateTime deadline,
  }) = _ChargeRequestCreationDTO;

  factory ChargeRequestCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$ChargeRequestCreationDTOFromJson(json);
}
