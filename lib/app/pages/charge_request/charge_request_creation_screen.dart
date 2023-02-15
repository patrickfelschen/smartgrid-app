import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/charge_request/charge_request_creation_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:smartgrid/data/models/charge_request_creation_dto.dart';
import 'package:validators/validators.dart';

class ChargeRequestCreationScreen extends ConsumerWidget {
  ChargeRequestCreationScreen({super.key});
  final TextEditingController deviceTextEditingController =
      TextEditingController();
  final TextEditingController deadlineTextEditingController =
      TextEditingController();
  final TextEditingController maxRequiredPowerTextEditingController =
      TextEditingController();
  final TextEditingController requiredCapacityTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final ChargeRequestCreationState state =
        ref.watch(chargeRequestCreationControllerProvider);

    if (state.selectedDevice != null) {
      deviceTextEditingController.text = state.selectedDevice!.description;
      maxRequiredPowerTextEditingController.text =
          state.selectedDevice!.maxPower.toString();
    }

    if (state.deadline != null) {
      deadlineTextEditingController.text =
          DateFormat("dd.MM.yyyy HH:mm").format(state.deadline!);
    }

    ref.listen(chargeRequestCreationControllerProvider, (previous, next) {
      if (next.status == StateStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Server: Fehler beim erstellen!"),
          ),
        );
        Navigator.of(context).pop();
      }
      if (next.status == StateStatus.success) {
        Navigator.of(context).pop();
      }
    });

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
        lastDate: DateTime.now().add(
          const Duration(
            days: 30,
          ),
        ),
      );

      DateTime a = DateTime.now().add(
        const Duration(minutes: 30),
      );

      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(a),
      );

      if (date != null && time != null) {
        DateTime finalDeadline =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
        ref
            .read(chargeRequestCreationControllerProvider.notifier)
            .selectDeadline(finalDeadline);
      }
    }

    void createChargeRequest() async {
      if (formKey.currentState!.validate()) {
        ChargeRequestCreationDTO creationDto = ChargeRequestCreationDTO(
          maxRequiredPower:
              double.parse(maxRequiredPowerTextEditingController.text),
          requiredCapacity:
              double.parse(requiredCapacityTextEditingController.text),
          deadline: state.deadline!,
        );
        await ref
            .read(chargeRequestCreationControllerProvider.notifier)
            .createChargeRequest(creationDto);
      }
    }

    Widget bodyContent = Builder(
      builder: ((context) => Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                const Icon(
                  Icons.add_chart,
                  size: 200.0,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: deviceTextEditingController,
                  readOnly: true,
                  validator: (value) =>
                      !isNull(value.toString()) ? null : "Gib ein Gerät ein",
                  onTap: () => openDeviceSelection(context),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.electrical_services),
                    border: OutlineInputBorder(),
                    label: Text("Geräteprofil"),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: deadlineTextEditingController,
                  readOnly: true,
                  validator: (value) =>
                      !isNull(value.toString()) ? null : "Gib ein Datum ein",
                  onTap: () => openDeadlineSelection(context),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.access_time),
                    border: OutlineInputBorder(),
                    label: Text("Abfahrtszeit"),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: maxRequiredPowerTextEditingController,
                  validator: (value) =>
                      isFloat(value.toString()) ? null : "Gib eine Nummer ein",
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixText: "kW",
                    suffixIcon: Icon(Icons.electric_car),
                    border: OutlineInputBorder(),
                    label: Text("Maximale Leistung des Verbrauchers"),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: requiredCapacityTextEditingController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Gib eine Nummer ein";
                    }
                    if (isFloat(value)) {
                      return null;
                    }
                    return "Gib eine Nummer ein";
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixText: "kWh",
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
            ),
          )),
    );

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeantrag erstellen"),
      ),
      body: state.status == StateStatus.loading ? bodyLoading : bodyContent,
    );
  }
}
