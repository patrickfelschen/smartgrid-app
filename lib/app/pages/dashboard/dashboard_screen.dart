import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/dashboard/dashboard_controller.dart';

import '../charge_plan/charge_plan_list_screen.dart';
import '../charge_request/charge_request_creation_screen.dart';
import '../option/option_screen.dart';

class DashboardScreen extends ConsumerWidget {
  final TextEditingController totalCo2SavingValueController =
      TextEditingController();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DashboardState state = ref.watch(dashboardControllerProvider);

    if (state.status == StateStatus.success) {
      totalCo2SavingValueController.text =
          state.dashboardInfo!.totalCo2SavingValue.toString();
    }

    Future refresh() async {
      await ref.read(dashboardControllerProvider.notifier).getDashboardInfo();
    }

    Widget bodyContent = RefreshIndicator(
      onRefresh: refresh,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          //const Text("Übersicht"),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Icon(
                  Icons.cloud_done,
                  size: 128.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Du hast bisher",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${totalCo2SavingValueController.text} Gramm",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Treibhausgase pro Kilowattstunde eingespart!",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Divider(),
          const SizedBox(
            height: 12.0,
          ),
          Card(
            elevation: 8,
            child: ListTile(
              leading: Icon(
                Icons.add_chart,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Ladeantrag erstellen"),
              subtitle: const Text("Erstelle einen neuen Antrag"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChargeRequestCreationScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Card(
            elevation: 8,
            child: ListTile(
              leading: Icon(
                Icons.history,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text("Ladeplan Liste"),
              subtitle: const Text("Erhalte eine Übersicht der Ladungen"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ChargePlanListScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

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
      body: state.status == StateStatus.loading ? bodyLoading : bodyContent,
    );
  }
}
