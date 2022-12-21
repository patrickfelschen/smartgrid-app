import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/device/device_controller.dart';

import '../dashboard/dashboard_screen.dart';

class DeviceCreationScreen extends ConsumerWidget {
  const DeviceCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(deviceControllerProvider);

    ref.listen<AsyncValue>(deviceControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        print(state.value);
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Geräte Profil erstellen"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.electrical_services,
            size: 200.0,
            color: Colors.green,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.electric_meter),
              border: OutlineInputBorder(),
              label: Text(
                "HUB-Anschluss",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.edit),
              border: OutlineInputBorder(),
              label: Text(
                "Bezeichnung",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixText: "kW",
              suffixIcon: Icon(Icons.electric_bolt),
              border: OutlineInputBorder(),
              label: Text(
                "Maximale Leistung",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DashboardScreen(),
                ),
              );
            },
            child: const Text(
              "Fertig",
            ),
          ),
        ],
      ),
    );
  }
}
