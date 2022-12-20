class ChargeRequestEntity {
  final int id;
  final double maxRequiredPower;
  final double requiredCapacity;
  final DateTime deadline;

  ChargeRequestEntity({
    required this.id,
    required this.maxRequiredPower,
    required this.requiredCapacity,
    required this.deadline,
  });

  @override
  String toString() {
    return "$id $maxRequiredPower $requiredCapacity $deadline";
  }
}
