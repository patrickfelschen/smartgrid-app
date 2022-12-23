import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/providers/auth_provider.dart';
import 'package:smartgrid/data/models/customer_creation_dto.dart';
import 'package:validators/validators.dart';

class SignUpScreen extends ConsumerWidget {
  final TextEditingController customerIdController = TextEditingController();
  final TextEditingController hubIdController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController postalcodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final formKey = GlobalKey<FormState>();

    void signUp() {
      if (formKey.currentState!.validate()) {
        String customerIdText = customerIdController.text.trim();
        String hubIdText = hubIdController.text.trim();
        String streetText = streetController.text.trim();
        String numberText = numberController.text.trim();
        String postalcodeText = postalcodeController.text.trim();
        String cityText = cityController.text.trim();

        int customerId = int.parse(customerIdText);
        int hubid = int.parse(hubIdText);

        CustomerCreationDTO creationDTO = CustomerCreationDTO(
          id: customerId,
          hubid: hubid,
          street: streetText,
          number: numberText,
          postalcode: postalcodeText,
          city: cityText,
        );

        ref.read(authNotifierProvider.notifier).signUp(creationDTO);
        Navigator.pop(context);
      }
    }

    Widget newBody() {
      return ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        children: [
          const Icon(
            Icons.person,
            size: 200.0,
            color: Colors.green,
          ),
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: customerIdController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  validator: (value) {
                    return isNumeric(value.toString())
                        ? null
                        : 'Gib eine Nummer ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Kundennummer",
                    ),
                    hintText: "93483854738",
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: hubIdController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return isNumeric(value.toString())
                        ? null
                        : 'Gib eine Nummer ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                    label: Text(
                      "HUB-Nummer",
                    ),
                    hintText: "3427",
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: streetController,
                  validator: (value) {
                    return isLength(value.toString(), 2)
                        ? null
                        : 'Gib eine Straße ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Straße",
                    ),
                    hintText: "Musterstraße",
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: numberController,
                  validator: (value) {
                    return isLength(value.toString(), 1)
                        ? null
                        : 'Gib eine Hausnummer ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Hausnummer",
                    ),
                    hintText: "1a",
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: postalcodeController,
                  validator: (value) {
                    return isPostalCode(value.toString(), "DE")
                        ? null
                        : 'Gib eine Postleitzahl ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Postleitzahl",
                    ),
                    hintText: "98765",
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: cityController,
                  validator: (value) {
                    return isLength(value.toString(), 1)
                        ? null
                        : 'Gib einen Ort ein';
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Ort",
                    ),
                    hintText: "Musterstadt",
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: auth.loading ? null : () => signUp(),
            child: auth.loading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                : const Text("Anmelden"),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konto erstellen",
        ),
      ),
      body: newBody(),
    );
  }
}
