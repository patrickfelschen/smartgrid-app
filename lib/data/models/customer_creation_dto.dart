import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_creation_dto.freezed.dart';
part 'customer_creation_dto.g.dart';

@freezed
class CustomerCreationDTO with _$CustomerCreationDTO {
  factory CustomerCreationDTO({
    required int id,
    required int hubid,
    required String street,
    required String number,
    required String postalcode,
    required String city,
  }) = _CustomerCreationDTO;

  factory CustomerCreationDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreationDTOFromJson(json);
}
