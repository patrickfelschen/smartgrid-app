typedef CustomerID = int;

class CustomerEntity {
  final int id;
  final int hubId;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerEntity({
    required this.id,
    required this.hubId,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });

  @override
  String toString() {
    return "$id $hubId $street $number $postalcode $city";
  }
}
