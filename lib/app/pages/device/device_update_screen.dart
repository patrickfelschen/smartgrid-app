import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/device/device_update_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:validators/validators.dart';

class DeviceUpdateScreen extends ConsumerWidget {
  DeviceUpdateScreen({super.key});

  final TextEditingController deviceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController maxPowerController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
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

    void updateSelectedDevice() {
      if (formKey.currentState!.validate()) {}
    }

    Widget body() {
      switch (state.status) {
        case StateStatus.initial:
          deviceController.text = state.selectedDevice!.description;
          descriptionController.text = state.selectedDevice!.description;
          maxPowerController.text = state.selectedDevice!.maxPower.toString();
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
                readOnly: true,
                onTap: () => openDeviceSelection(),
                controller: deviceController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.electrical_services),
                  border: OutlineInputBorder(),
                  label: Text(
                    "HUB-Anschluss",
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Divider(),
              const SizedBox(
                height: 12.0,
              ),
              const Text("Bearbeiten"),
              const SizedBox(
                height: 24.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        return isLength(value.toString(), 4)
                            ? null
                            : 'min. 4 Zeichen';
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.text_snippet),
                        hintText: "E-Auto",
                        border: OutlineInputBorder(),
                        label: Text(
                          "Bezeichnung",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      controller: maxPowerController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        return isNumeric(value.toString())
                            ? null
                            : 'Gib eine Nummer ein';
                      },
                      decoration: const InputDecoration(
                        suffixText: "kW",
                        hintText: "12.5",
                        prefixIcon: Icon(Icons.electric_bolt),
                        border: OutlineInputBorder(),
                        label: Text(
                          "Maximale Leistung",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () => updateSelectedDevice(),
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
