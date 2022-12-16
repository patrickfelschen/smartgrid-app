class ChargePlanTimeEntity {
  final DateTime time;
  final double power;
  // grams of carbon dioxide equivalent per kilowatt-hour of electricity
  final double gCO2eqPerkWh;
  final double powerGridCapacity;

  ChargePlanTimeEntity({
    required this.time,
    required this.power,
    required this.gCO2eqPerkWh,
    required this.powerGridCapacity,
  });
}
