import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_plan_update_dto.freezed.dart';
part 'charge_plan_update_dto.g.dart';

@freezed
class ChargePlanUpdateDTO with _$ChargePlanUpdateDTO {
  factory ChargePlanUpdateDTO({
    required String status,
  }) = _ChargePlanUpdateDTO;

  factory ChargePlanUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$ChargePlanUpdateDTOFromJson(json);
}
