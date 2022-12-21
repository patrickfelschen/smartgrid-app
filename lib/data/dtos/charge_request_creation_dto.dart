class ChargeRequestCreationDTO {
  int? deviceId;
  final double maxRequiredPower;
  final double requiredCapacity;
  final DateTime deadline;

  ChargeRequestCreationDTO({
    this.deviceId,
    required this.maxRequiredPower,
    required this.requiredCapacity,
    required this.deadline,
  });

  factory ChargeRequestCreationDTO.fromMap(Map<String, dynamic> map) {
    return ChargeRequestCreationDTO(
      maxRequiredPower: map["maxRequiredPower"],
      requiredCapacity: map["requiredCapacity"],
      deadline: DateTime.parse(map["deadline"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "maxRequiredPower": maxRequiredPower,
      "requiredCapacity": requiredCapacity,
      "deadline": deadline.toIso8601String(),
    };
  }

  @override
  String toString() {
    return "$maxRequiredPower $requiredCapacity $deadline";
  }
}
