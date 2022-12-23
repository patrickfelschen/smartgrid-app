import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smartgrid/app/pages/charge_request/charge_request_creation_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';

class ChargeRequestCreationScreen extends ConsumerWidget {
  const ChargeRequestCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChargeRequestCreationState state =
        ref.watch(chargeRequestCreationControllerProvider);

    TextEditingController deviceTextEditingController = TextEditingController();
    if (state.selectedDevice != null) {
      deviceTextEditingController =
          TextEditingController(text: state.selectedDevice!.description);
    }

    TextEditingController deadlineTextEditingController =
        TextEditingController();
    if (state.selectedDeadline != null) {
      deadlineTextEditingController = TextEditingController(
          text: DateFormat("dd.MM.yyyy HH:mm").format(state.selectedDeadline!));
    }

    TextEditingController maxRequiredPowerTextEditingController =
        TextEditingController();

    TextEditingController requiredCapacityTextEditingController =
        TextEditingController();

    void createChargeRequest() async {
      ChargeRequestCreationDTO creationDto = ChargeRequestCreationDTO(
        deviceId: state.selectedDevice!.id,
        maxRequiredPower:
            double.parse(maxRequiredPowerTextEditingController.text),
        requiredCapacity:
            double.parse(requiredCapacityTextEditingController.text),
        deadline: state.selectedDeadline!,
      );
      await ref
          .read(chargeRequestCreationControllerProvider.notifier)
          .createChargeRequest(creationDto);
    }

    void openDeviceSelection(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: ((_) {
          return DeviceBottomSheet(
            devices: state.devices,
            onDeviceSelected: ((device) => ref
                .read(chargeRequestCreationControllerProvider.notifier)
                .selectDevice(device)),
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
        ref
            .read(chargeRequestCreationControllerProvider.notifier)
            .selectDeadline(finalDeadline);
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
                  Focus(
                    onFocusChange: (value) => print(value),
                    child: TextField(
                      onSubmitted: ((value) => print("onSubmitted")),
                      onEditingComplete: () => print("onEditingComplete"),
                      controller: maxRequiredPowerTextEditingController,
                      decoration: const InputDecoration(
                        suffixText: "kW",
                        suffixIcon: Icon(Icons.electric_car),
                        border: OutlineInputBorder(),
                        label: Text("Maximale Leistung des Verbrauchers"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: requiredCapacityTextEditingController,
                    decoration: const InputDecoration(
                      suffixText: "kW/h",
                      suffixIcon: Icon(Icons.electric_bolt),
                      border: OutlineInputBorder(),
                      label: Text("Benötigte Kapazität"),
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
