import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_controller.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanScreen extends ConsumerWidget {
  const ChargePlanScreen({super.key, required this.chargePlan});

  final ChargePlanEntity chargePlan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChargePlanState state = ref.watch(chargePlanControllerProvider);

    Widget bodyContent() {
      return ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Card(
            child: ListTile(
              trailing: const CircleAvatar(
                child: Icon(
                  Icons.electrical_services,
                ),
              ),
              title: Text(
                chargePlan.device.description,
              ),
              subtitle: const Text("Gerät"),
            ),
          ),
          Card(
            child: ListTile(
              trailing: const CircleAvatar(
                child: Icon(
                  Icons.add_chart,
                ),
              ),
              title: Text(
                "${chargePlan.request.requiredCapacity} kWh",
              ),
              subtitle: Text(
                DateFormat('dd.MM.yyyy - kk:mm').format(
                  chargePlan.request.deadline.add(const Duration(hours: 1)),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  chargePlan.status == "offen"
                      ? Icons.hourglass_empty
                      : Icons.check,
                ),
              ),
              title: const Text("Status"),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: lineChart(),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "${chargePlan.id}",
              ),
              subtitle: const Text("Plan-Identifikationsnummer"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "${chargePlan.request.id}",
              ),
              subtitle: const Text("Antrag-Identifikationsnummer"),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          removeButton(ref, context),
        ],
      );
    }

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

    Widget bodyError = const Center(
      child: Text("Unerwartete Antwort vom Server"),
    );

    Widget body() {
      switch (state.status) {
        case StateStatus.initial:
          return bodyContent();
        case StateStatus.loading:
          return bodyLoading;
        case StateStatus.success:
          return bodyContent();
        case StateStatus.failure:
          return bodyError;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeplan ansehen"),
      ),
      body: body(),
    );
  }

  Widget removeButton(WidgetRef ref, BuildContext context) {
    if (chargePlan.status == "offen") {
      return ElevatedButton(
        onPressed: () {
          ref.read(chargePlanControllerProvider.notifier).updateChargePlan(
                chargePlan.id,
              );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: const Text(
          "Abbrechen",
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  Stack lineChart() {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              //color: Color.fromARGB(255, 214, 217, 221),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12,
                left: 12,
                top: 12,
                bottom: 12,
              ),
              child: LineChart(chartData()),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData chartData() {
    return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: ((value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          }),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: const Text("Verlauf in min"),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: xAxisWidget,
            ),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Text("Geladen in kW"),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: yAxisWidget,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
          ),
        ),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            color: Colors.green,
            spots: const [
              FlSpot(0, 3.5),
              FlSpot(1, 2),
              FlSpot(3, 5),
              FlSpot(4, 3.1),
              FlSpot(5, 4),
              FlSpot(6, 3),
              FlSpot(7, 4),
              FlSpot(8, 3.5),
              FlSpot(9, 2),
              FlSpot(10, 1.5),
            ],
            barWidth: 3,
          )
        ]);
  }

  Widget xAxisWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 55, 56, 58),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('15', style: style);
        break;
      case 5:
        text = const Text('30', style: style);
        break;
      case 8:
        text = const Text('45', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget yAxisWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 55, 56, 58),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 3:
        text = '30';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
