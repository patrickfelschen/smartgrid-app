class CustomerCreationDTO {
  final int id;
  final String street;
  final String number;
  final String postalcode;
  final String city;

  CustomerCreationDTO({
    required this.id,
    required this.street,
    required this.number,
    required this.postalcode,
    required this.city,
  });
}