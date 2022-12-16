import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/authentication/customer_creation_controller.dart';
import 'package:smartgrid/app/pages/authentication/customer_sign_in_controller.dart';

import '../dashboard/dashboard_screen.dart';

class CustomerSignInScreen extends ConsumerWidget {
  const CustomerSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(customerSignInControllerProvider);

    void signIn() async {
      int id = 1;
      await ref.read(customerSignInControllerProvider.notifier).signIn(id);
    }

    ref.listen<AsyncValue>(customerSignInControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
          ),
        );
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString())),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anmelden",
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
              suffixIcon: Icon(Icons.key),
              border: OutlineInputBorder(),
              label: Text(
                "Kundennummer",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: state.isLoading ? null : () => signIn(),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text("Anmelden"),
          )
        ],
      ),
    );
  }
}
