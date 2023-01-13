import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/device/device_profile_controller.dart';
import 'package:smartgrid/data/models/device_update_dto.dart';
import 'package:validators/validators.dart';

class DeviceProfileScreen extends ConsumerWidget {
  DeviceProfileScreen({super.key});

  bool _deviceSelected = false;

  final TextEditingController deviceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController maxPowerController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final DeviceProfileState state = ref.watch(deviceControllerProvider);

    void updateSelectedDevice() {
      if (formKey.currentState!.validate()) {
        DeviceUpdateDTO updateDTO = DeviceUpdateDTO(
          description: descriptionController.text,
          maxPower: double.parse(maxPowerController.text),
        );
        ref.read(deviceControllerProvider.notifier).updateDevice(
              state.selectedDevice!.id,
              updateDTO,
            );
        _deviceSelected = false;
      }
    }

    Widget gridBody() {
      switch (state.status) {
        case StateStatus.initial:
          return GridView.count(
            padding: const EdgeInsets.all(12.0),
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: List.from(
              state.devices!.map(
                (device) => Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(deviceControllerProvider.notifier)
                          .selectDevice(device);
                      _deviceSelected = true;
                    },
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.electrical_services,
                                size: 128,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                device.description.trim(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Maximale Leistung: ${device.maxPower} kW",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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

    Widget updateBody() {
      switch (state.status) {
        case StateStatus.initial:
          deviceController.text = state.selectedDevice!.description.trim();
          descriptionController.text = state.selectedDevice!.description.trim();
          maxPowerController.text =
              state.selectedDevice!.maxPower.toString().trim();
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
                        return isFloat(value.toString())
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

    return WillPopScope(
      onWillPop: () async {
        if (_deviceSelected) {
          _deviceSelected = false;
          ref.read(deviceControllerProvider.notifier).selectDevice(null);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Geräte Profil"),
            actions: const [
              /*IconButton(
                onPressed: () {
                  _creationMode = true;
                },
                icon: const Icon(
                  Icons.add,
                ),
              )*/
            ],
          ),
          body: _deviceSelected ? updateBody() : gridBody()),
    );
  }
}
