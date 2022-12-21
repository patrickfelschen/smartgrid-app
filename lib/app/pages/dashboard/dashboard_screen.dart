import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/dashboard/dashboard_controller.dart';
import 'package:smartgrid/domain/entities/dashboard_info_entity.dart';
import '../charge_plan/charge_plan_list_screen.dart';
import '../charge_request/charge_request_creation_screen.dart';
import '../option/option_screen.dart';

class DashboardScreen extends ConsumerWidget {
  final TextEditingController smartValueController = TextEditingController();
  final TextEditingController notSmartValueController = TextEditingController();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(dashboardControllerProvider);

    ref.listen<AsyncValue>(dashboardControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        DashboardInfoEntity dashboardInfo = state.value;
        smartValueController.text = dashboardInfo.totalCo2ValueSmart.toString();
        notSmartValueController.text =
            dashboardInfo.totalCo2ValueNotSmart.toString();
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      }
    });

    Future refresh() async {
      await ref.watch(dashboardControllerProvider.notifier).getDashboardInfo();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Smart Grid"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const OptionScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            children: [
              const Icon(
                Icons.electric_bolt,
                size: 200.0,
                color: Colors.green,
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: smartValueController,
                readOnly: true,
                decoration: const InputDecoration(
                  suffixText: "g/kWh",
                  border: OutlineInputBorder(),
                  label: Text(
                    "Gesamteinsparung",
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: notSmartValueController,
                readOnly: true,
                decoration: const InputDecoration(
                  suffixText: "kWh",
                  border: OutlineInputBorder(),
                  label: Text(
                    "Gesamt Energie",
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ChargeRequestCreationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.battery_charging_full),
                label: const Text(
                  "Ladeantrag erstellen",
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ChargePlanListScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.history),
                label: const Text(
                  "Ladeplan Liste",
                ),
              ),
            ],
          ),
        ));
  }
}
