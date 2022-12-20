class DeviceUpdateDTO {
  final String description;
  final double maxPower;

  const DeviceUpdateDTO({
    required this.description,
    required this.maxPower,
  });

  @override
  String toString() {
    return "$description $maxPower";
  }
}
