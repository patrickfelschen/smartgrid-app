import 'package:flutter/material.dart';

class ChargePlanScreen extends StatelessWidget {
  const ChargePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
