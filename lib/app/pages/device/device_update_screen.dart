import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/device/device_update_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';

import '../dashboard/dashboard_screen.dart';

class DeviceUpdateScreen extends ConsumerWidget {
  DeviceUpdateScreen({super.key});

  final TextEditingController deviceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController maxPowerController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DeviceUpdateState state = ref.watch(deviceControllerProvider);

    void openDeviceSelection() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return DeviceBottomSheet(
            devices: state.devices!,
            onDeviceSelected: (selectedDevice) {
              ref
                  .read(deviceControllerProvider.notifier)
                  .selectDevice(selectedDevice);
            },
          );
        },
      );
    }

    Widget body() {
      switch (state.status) {
        case StateStatus.initial:
          deviceController.text = state.selectedDevice!.description;
          return ListView(
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
              TextFormField(
                onTap: () => openDeviceSelection(),
                controller: deviceController,
                decoration: const InputDecoration(
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
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
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
              TextField(
                controller: maxPowerController,
                decoration: const InputDecoration(
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
          );

        case StateStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case StateStatus.failure:
          return const Center();
        case StateStatus.success:
          return const Center();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Geräte Profil bearbeiten"),
      ),
      body: body(),
    );
  }
}
