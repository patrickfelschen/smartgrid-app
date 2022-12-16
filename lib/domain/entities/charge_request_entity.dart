class ChargeRequestEntity {
  final int id;
  final double requiredPower;
  final double capacity;
  final DateTime deadline;

  ChargeRequestEntity({
    required this.id,
    required this.requiredPower,
    required this.capacity,
    required this.deadline,
  });
}
