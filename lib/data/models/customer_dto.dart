import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

part 'customer_dto.freezed.dart';
part 'customer_dto.g.dart';

@unfreezed
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

/*
class CustomerDTO {
  final int id;
  final int hubId;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerDTO({
    required this.id,
    required this.hubId,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });

  factory CustomerDTO.fromMap(Map<String, dynamic> map) {
    return CustomerDTO(
      id: map["id"],
      hubId: map["hubid"],
      street: map["street"],
      number: map["number"],
      postalcode: map["postalcode"],
      city: map["city"],
    );
  }

  factory CustomerDTO.fromJson(String source) =>
      CustomerDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "hubid": hubId,
      "street": street,
      "number": number,
      "postalcode": postalcode,
      "city": city
    };
  }

  static CustomerEntity fromDTO(CustomerDTO dto) {
    return CustomerEntity(
      id: dto.id,
      hubId: dto.hubId,
      street: dto.street,
      number: dto.number,
      postalcode: dto.postalcode,
      city: dto.city,
    );
  }

  static CustomerDTO toDTO(CustomerEntity entity) {
    return CustomerDTO(
      id: entity.id,
      hubId: entity.hubId,
      street: entity.street,
      number: entity.number,
      postalcode: entity.postalcode,
      city: entity.city,
    );
  }

  String toJson() => json.encode(toMap());
}
*/