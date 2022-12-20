import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_list_controller.dart';

import 'charge_plan_screen.dart';

class ChargePlanListScreen extends ConsumerWidget {
  const ChargePlanListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(chargePlanListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladepläne"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.history,
            size: 200.0,
            color: Colors.green,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ChargePlanScreen(),
                ),
              );
            },
            leading: const CircleAvatar(
              child: Icon(Icons.timeline),
            ),
            title: const Text("Ladeplan"),
            subtitle: const Text("vom 01.12.2022"),
            trailing: const Text("Aktiv"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ChargePlanScreen(),
                ),
              );
            },
            leading: const CircleAvatar(
              child: Icon(Icons.timeline),
            ),
            title: const Text("Ladeplan"),
            subtitle: const Text("vom 10.11.2022"),
            trailing: const Text("Fertig"),
          )
        ],
      ),
    );
  }
}
