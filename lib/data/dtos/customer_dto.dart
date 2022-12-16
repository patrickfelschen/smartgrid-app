import 'package:smartgrid/domain/entities/customer_entity.dart';

class CustomerDTO {
  final int id;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerDTO({
    required this.id,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });

  factory CustomerDTO.fromMap(Map<String, dynamic> map) {
    return CustomerDTO(
      id: map["id"],
      street: map["street"],
      number: map["number"],
      postalcode: map["postalcode"],
      city: map["city"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "street": street,
      "number": number,
      "postalcode": postalcode,
      "city": city
    };
  }

  static CustomerEntity fromDTO(CustomerDTO dto) {
    return CustomerEntity(
      id: dto.id,
      street: dto.street,
      number: dto.number,
      postalcode: dto.postalcode,
      city: dto.city,
    );
  }
}
