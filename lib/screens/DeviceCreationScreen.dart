import 'package:flutter/material.dart';
import 'package:smartgrid/screens/DashboardScreen.dart';

class DeviceCreationScreen extends StatelessWidget {
  const DeviceCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geräte Profil erstellen"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        children: [
          const Icon(
            Icons.electrical_services,
            size: 200.0,
            color: Colors.green,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.electric_meter),
              border: OutlineInputBorder(),
              label: Text(
                "HUB-Anschluss",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.edit),
              border: OutlineInputBorder(),
              label: Text(
                "Bezeichnung",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              suffixText: "kW",
              suffixIcon: Icon(Icons.electric_bolt),
              border: OutlineInputBorder(),
              label: Text(
                "Maximale Leistung",
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const DashboardScreen(),
                ),
              );
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
