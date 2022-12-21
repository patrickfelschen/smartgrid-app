class CustomerCreationDTO {
  final int id;
  final int hubId;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerCreationDTO({
    required this.id,
    required this.hubId,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });

  factory CustomerCreationDTO.fromMap(Map<String, dynamic> map) {
    return CustomerCreationDTO(
      id: map["id"],
      hubId: map["hubid"],
      street: map["street"],
      number: map["number"],
      postalcode: map["postalcode"],
      city: map["city"],
    );
  }

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
}
