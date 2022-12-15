import 'package:flutter/material.dart';

class ChargeRequestCreationScreen extends StatelessWidget {
  const ChargeRequestCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const TextField(
            decoration: InputDecoration(
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
              Navigator.of(context).pop();
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
