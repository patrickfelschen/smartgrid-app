import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_controller.dart';

class ChargePlanScreen extends ConsumerWidget {
  const ChargePlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.read(chargePlanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeplan ansehen"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.timeline,
            size: 200.0,
            color: Colors.green,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(),
              label: Text(
                "Plan ID",
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
                "Antrag ID",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              "Abbrechen",
            ),
          ),
        ],
      ),
    );
  }
}
