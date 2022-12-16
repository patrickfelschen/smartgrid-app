typedef CustomerID = int;

class CustomerEntity {
  final int id;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerEntity({
    required this.id,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });

  factory CustomerEntity.fromMap(Map<String, dynamic> map, CustomerID id) {
    return CustomerEntity(
      id: id,
      street: map["street"],
      number: map["number"],
      postalcode: map["postalcode"],
      city: map["city"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "street": street,
      "number": number,
      "postalcode": postalcode,
      "city": city
    };
  }

  @override
  String toString() {
    return "$id $street $number $postalcode $city";
  }
}
