class DashboardInfoEntity {
  final double totalCo2ValueSmart;
  final double totalCo2ValueNotSmart;

  DashboardInfoEntity({
    required this.totalCo2ValueSmart,
    required this.totalCo2ValueNotSmart,
  });

  @override
  String toString() {
    return "$totalCo2ValueSmart $totalCo2ValueNotSmart";
  }
}
