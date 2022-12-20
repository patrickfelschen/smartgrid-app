import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/authentication/customer_creation_controller.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';

import '../dashboard/dashboard_screen.dart';

class CustomerCreationScreen extends ConsumerWidget {
  final TextEditingController customerIdController = TextEditingController();
  final TextEditingController hubIdController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController postalcodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  CustomerCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(customerCreationControllerProvider);

    void signUp() async {
      String customerIdText = customerIdController.text.trim();
      String hubIdText = hubIdController.text.trim();
      String streetText = streetController.text.trim();
      String numberText = numberController.text.trim();
      String postalcodeText = postalcodeController.text.trim();
      String cityText = cityController.text.trim();

      if (customerIdText.isNotEmpty &&
          hubIdText.isNotEmpty &&
          streetText.isNotEmpty &&
          numberText.isNotEmpty &&
          postalcodeText.isNotEmpty &&
          cityText.isNotEmpty) {
        int customerId = int.parse(customerIdText);
        int hubId = int.parse(hubIdText);

        CustomerCreationDTO creationDTO = CustomerCreationDTO(
          id: customerId,
          hubId: hubId,
          street: streetText,
          number: numberText,
          postalcode: postalcodeText,
          city: cityText,
        );

        await ref
            .read(customerCreationControllerProvider.notifier)
            .signUp(creationDTO);
      }
    }

    ref.listen<AsyncValue>(customerCreationControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DashboardScreen(),
          ),
        );
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString())),
        );
      }
    });

    Widget body = ListView(
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
        TextField(
          controller: customerIdController,
          decoration: const InputDecoration(
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
        TextField(
          controller: hubIdController,
          decoration: const InputDecoration(
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
        TextField(
          controller: streetController,
          decoration: const InputDecoration(
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
        TextField(
          controller: numberController,
          decoration: const InputDecoration(
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
        TextField(
          controller: postalcodeController,
          decoration: const InputDecoration(
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
        TextField(
          controller: cityController,
          decoration: const InputDecoration(
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
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konto erstellen",
        ),
      ),
      body: body,
    );
  }
}
