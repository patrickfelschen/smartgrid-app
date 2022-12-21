import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/charge_request/charge_request_creation_controller.dart';
import 'package:smartgrid/app/widgets/device_bottom_sheet.dart';
import 'package:smartgrid/data/dtos/charge_request_creation_dto.dart';

class ChargeRequestCreationScreen extends ConsumerWidget {
  const ChargeRequestCreationScreen({super.key});

  void openDeviceSelection(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: ((_) {
        return const DeviceBottomSheet();
      }),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(chargeRequestCreationControllerProvider);

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
        print(state.value);
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString())),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeantrag erstellen"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.battery_charging_full,
            size: 200.0,
            color: Colors.green,
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            readOnly: true,
            onTap: () => openDeviceSelection(context),
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.electrical_services),
              border: OutlineInputBorder(),
              label: Text(
                "Geräteprofil",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.access_time),
              border: OutlineInputBorder(),
              label: Text(
                "Abfahrtszeit",
              ),
            ),
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
      ),
    );
  }
}
