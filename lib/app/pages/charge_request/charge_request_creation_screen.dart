import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smartgrid/app/pages/charge_request/charge_request_creation_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class ChargeRequestCreationScreen extends ConsumerWidget {
  List<DeviceEntity> _devices = List.empty();

  ChargeRequestCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(chargeRequestCreationControllerProvider);
    DeviceEntity? selectedDevice = ref.watch(selectedDeviceProvider);
    DateTime? deadline = ref.watch(deadlineProvider);

    TextEditingController deviceTextEditingController = TextEditingController();
    if (selectedDevice != null) {
      deviceTextEditingController =
          TextEditingController(text: selectedDevice.description);
    }

    TextEditingController deadlineTextEditingController =
        TextEditingController();
    if (deadline != null) {
      deadlineTextEditingController = TextEditingController(
          text: DateFormat("dd.MM.yyyy HH:mm").format(deadline));
    }

    void createChargeRequest() async {
      ChargeRequestCreationDTO creationDto = ChargeRequestCreationDTO(
        maxRequiredPower: 250,
        requiredCapacity: 80,
        deadline: DateTime(2022),
      );
      await ref
          .read(chargeRequestCreationControllerProvider.notifier)
          .createChargeRequest(creationDto);
    }

    ref.listen<AsyncValue>(chargeRequestCreationControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        _devices = state.value;
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString())),
        );
      }
    });

    void openDeviceSelection(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: ((_) {
          return DeviceBottomSheet(
            devices: _devices,
            onDeviceSelected: ((device) =>
                ref.read(selectedDeviceProvider.notifier).state = device),
          );
        }),
      );
    }

    void openDeadlineSelection(BuildContext context) async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023),
      );

      TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (date != null && time != null) {
        DateTime finalDeadline =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
        ref.read(deadlineProvider.notifier).state = finalDeadline;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ladeantrag erstellen"),
        ),
        body: Builder(
          builder: ((context) => ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                children: [
                  const Icon(
                    Icons.add_chart,
                    size: 200.0,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: deviceTextEditingController,
                    readOnly: true,
                    onTap: () => openDeviceSelection(context),
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.electrical_services),
                        border: OutlineInputBorder(),
                        label: Text("Geräteprofil")),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: deadlineTextEditingController,
                    readOnly: true,
                    onTap: () => openDeadlineSelection(context),
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(),
                        label: Text("Abfahrtszeit")),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      suffixText: "kW",
                      suffixIcon: Icon(Icons.electric_car),
                      border: OutlineInputBorder(),
                      label: Text(
                        "Maximale Leistung des Verbrauchers",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      suffixText: "kW/h",
                      suffixIcon: Icon(Icons.electric_bolt),
                      border: OutlineInputBorder(),
                      label: Text(
                        "Benötigte Kapazität",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.of(context).pop();
                      createChargeRequest();
                    },
                    child: const Text(
                      "Fertig",
                    ),
                  ),
                ],
              )),
        ));
  }
}
