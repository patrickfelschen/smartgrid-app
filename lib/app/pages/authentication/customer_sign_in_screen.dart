import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/authentication/auth_provider.dart';
import 'package:smartgrid/app/pages/authentication/customer_creation_screen.dart';
import 'package:validators/validators.dart';

class CustomerSignInScreen extends ConsumerWidget {
  final TextEditingController customerIdController = TextEditingController();

  CustomerSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final formKey = GlobalKey<FormState>();

    void signIn() {
      if (formKey.currentState!.validate()) {
        final customerIdText = customerIdController.text;
        int customerId = int.parse(customerIdText);
        ref.read(authNotifierProvider.notifier).signIn(customerId);
      }
    }

    void signUp() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CustomerCreationScreen(),
        ),
      );
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
                    suffixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                    label: Text(
                      "Kundennummer",
                    ),
                    hintText: "93483854738",
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: auth.loading ? null : () => signIn(),
            child: auth.loading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                : const Text("Anmelden"),
          ),
          OutlinedButton(
            onPressed: auth.loading ? null : () => signUp(),
            child: const Text("Neues Konto erstellen"),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anmelden",
        ),
      ),
      body: newBody(),
    );
  }
}
