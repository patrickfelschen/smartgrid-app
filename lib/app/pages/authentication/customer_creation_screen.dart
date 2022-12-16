import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/authentication/customer_creation_controller.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';

import '../dashboard/dashboard_screen.dart';

class CustomerCreationScreen extends ConsumerWidget {
  const CustomerCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(customerCreationControllerProvider);

    void signUp() async {
      CustomerCreationDTO creationDTO = CustomerCreationDTO(
        id: 1,
        street: "Straße",
        number: "5",
        postalcode: "12345",
        city: "Entenhausen",
      );
      await ref
          .read(customerCreationControllerProvider.notifier)
          .signUp(creationDTO);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konto erstellen",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.person,
            size: 200.0,
            color: Colors.green,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(),
              label: Text(
                "Kundennummer",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(),
              label: Text(
                "HUB-Nummer",
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
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.location_pin),
              border: OutlineInputBorder(),
              label: Text(
                "Straße",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.location_pin),
              border: OutlineInputBorder(),
              label: Text(
                "Hausnummer",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.location_pin),
              border: OutlineInputBorder(),
              label: Text(
                "Postleitzahl",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.location_pin),
              border: OutlineInputBorder(),
              label: Text(
                "Ort",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: state.isLoading ? null : () => signUp(),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text("Fertig"),
          ),
        ],
      ),
    );
  }
}
