import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/charge_request/charge_request_creation_controller.dart';
import 'package:smartgrid/app/pages/dashboard/dashboard_screen.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';

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
    if (state.deadline != null) {
      deadlineTextEditingController = TextEditingController(
          text: DateFormat("dd.MM.yyyy HH:mm").format(state.deadline!));
    }

    TextEditingController maxRequiredPowerTextEditingController =
        TextEditingController(text: state.maxRequiredPower.toString());

    TextEditingController requiredCapacityTextEditingController =
        TextEditingController(text: state.requiredCapacity.toString());

    void createChargeRequest() async {
      ChargeRequestCreationDTO creationDto = ChargeRequestCreationDTO(
        maxRequiredPower: state.maxRequiredPower,
        requiredCapacity: state.requiredCapacity,
        deadline: state.deadline!,
      );
      await ref
          .read(chargeRequestCreationControllerProvider.notifier)
          .createChargeRequest(creationDto);
      if (state.status == StateStatus.success) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DashboardScreen(),
          ),
        );
      }
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

    void setMaxRequiredPower() {
      ref
          .read(chargeRequestCreationControllerProvider.notifier)
          .setMaxRequiredPower(
              double.parse(maxRequiredPowerTextEditingController.text));
    }

    void setRequiredCapacity() {
      ref
          .read(chargeRequestCreationControllerProvider.notifier)
          .setRequiredCapacity(
              double.parse(requiredCapacityTextEditingController.text));
    }

    Widget bodyContent = Builder(
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
                onFocusChange: (value) => {if (!value) setMaxRequiredPower()},
                child: TextField(
                  controller: maxRequiredPowerTextEditingController,
                  keyboardType: TextInputType.number,
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
              Focus(
                onFocusChange: ((value) => {if (!value) setRequiredCapacity()}),
                child: TextField(
                  controller: requiredCapacityTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixText: "kW/h",
                    suffixIcon: Icon(Icons.electric_bolt),
                    border: OutlineInputBorder(),
                    label: Text("Benötigte Kapazität"),
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
    );

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ladeantrag erstellen"),
        ),
        body: state.status == StateStatus.loading ? bodyLoading : bodyContent);
  }
}
