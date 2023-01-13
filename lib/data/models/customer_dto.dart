import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

part 'customer_dto.freezed.dart';
part 'customer_dto.g.dart';

@freezed
class CustomerDTO with _$CustomerDTO {
  factory CustomerDTO({
    required int id,
    required int hubid,
    required String street,
    required String number,
    required String postalcode,
    required String city,
  }) = _CustomerDTO;

  static CustomerEntity fromDTO(CustomerDTO dto) {
    return CustomerEntity(
      id: dto.id,
      hubid: dto.hubid,
      street: dto.street,
      number: dto.number,
      postalcode: dto.postalcode,
      city: dto.city,
    );
  }

  factory CustomerDTO.toDTO(CustomerEntity entity) => CustomerDTO(
        id: entity.id,
        hubid: entity.hubid,
        street: entity.street,
        number: entity.number,
        postalcode: entity.postalcode,
        city: entity.city,
      );

  factory CustomerDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerDTOFromJson(json);
}
