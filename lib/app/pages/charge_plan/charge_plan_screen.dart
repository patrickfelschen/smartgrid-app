import 'package:expandable/expandable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_controller.dart';

class ChargePlanScreen extends ConsumerWidget {
  const ChargePlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChargePlanState state = ref.watch(chargePlanControllerProvider);

    TextEditingController planIdTextEditingController =
        TextEditingController(text: "Plan ID");
    TextEditingController requestIdTextEditingController =
        TextEditingController(text: "Antrag ID");

    if (state.status == StateStatus.success) {
      planIdTextEditingController.text = state.chargePlan!.id.toString();
      requestIdTextEditingController.text =
          state.chargePlan!.request.id.toString();
    }

    Widget bodyContent = ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      children: [
        const Icon(
          Icons.timeline,
          size: 200.0,
          color: Colors.green,
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextField(
          controller: planIdTextEditingController,
          readOnly: true,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.numbers),
            border: OutlineInputBorder(),
            label: Text("Plan ID"),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextField(
          controller: requestIdTextEditingController,
          readOnly: true,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.numbers),
            border: OutlineInputBorder(),
            label: Text(
              "Antrag ID",
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ExpandablePanel(
              header: const Text(
                "Ladeverlauf",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              collapsed: const Text("Tippen zum Anzeigen"),
              expanded: lineChart(),
              theme: const ExpandableThemeData(
                iconColor: Colors.green,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            "Abbrechen",
          ),
        ),
      ],
    );

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeplan ansehen"),
      ),
      body: state.status == StateStatus.loading ? bodyLoading : bodyContent,
    );
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
              color: Color.fromARGB(255, 214, 217, 221),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
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
