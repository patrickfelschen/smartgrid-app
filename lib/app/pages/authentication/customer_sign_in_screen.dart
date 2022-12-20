import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/authentication/customer_creation_screen.dart';
import 'package:smartgrid/app/pages/authentication/customer_sign_in_controller.dart';

import '../dashboard/dashboard_screen.dart';

class CustomerSignInScreen extends ConsumerWidget {
  final TextEditingController customerIdController = TextEditingController();

  CustomerSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(customerSignInControllerProvider);

    void signIn() async {
      String customerIdText = customerIdController.text.trim();
      if (customerIdText.isEmpty) return;
      int customerId = int.parse(customerIdText);
      await ref
          .read(customerSignInControllerProvider.notifier)
          .signIn(customerId);
    }

    void signUp() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CustomerCreationScreen(),
        ),
      );
    }

    ref.listen<AsyncValue>(customerSignInControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => DashboardScreen(),
          ),
        );
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
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
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.key),
            border: OutlineInputBorder(),
            label: Text(
              "Kundennummer",
            ),
            //errorText: state.hasError ? state.error.toString() : null,
          ),
        ),
        ElevatedButton(
          onPressed: state.isLoading ? null : () => signIn(),
          child: state.isLoading
              ? const CircularProgressIndicator()
              : const Text("Anmelden"),
        ),
        OutlinedButton(
          onPressed: state.isLoading ? null : () => signUp(),
          child: const Text("Neues Konto erstellen"),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anmelden",
        ),
      ),
      body: body,
    );
  }
}
