import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/state_status.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_controller.dart';

class ChargePlanScreen extends ConsumerWidget {
  const ChargePlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChargePlanState state = ref.watch(chargePlanControllerProvider);

    TextEditingController planIdTextEditingController =
        TextEditingController(text: "Plan ID");
    TextEditingController requestIdTextEditingController =
        TextEditingController(text: "Antrag ID");

    if (state.status == StateStatus.success) {
      planIdTextEditingController.text = state.chargePlan!.id.toString();
      requestIdTextEditingController.text =
          state.chargePlan!.request.id.toString();
    }

    Widget bodyContent = ListView(
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
        TextField(
          controller: planIdTextEditingController,
          readOnly: true,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.numbers),
            border: OutlineInputBorder(),
            label: Text("Plan ID"),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextField(
          controller: requestIdTextEditingController,
          readOnly: true,
          decoration: const InputDecoration(
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
    );

    Widget bodyLoading = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladeplan ansehen"),
      ),
      body: state.status == StateStatus.loading ? bodyLoading : bodyContent,
    );
  }
}
