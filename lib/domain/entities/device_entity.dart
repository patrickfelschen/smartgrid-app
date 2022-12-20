class DeviceEntity {
  final int id;
  final String description;
  final double maxPower;

  const DeviceEntity({
    required this.id,
    required this.description,
    required this.maxPower,
  });

  @override
  String toString() {
    return "$id $description $maxPower";
  }
}
