import 'package:flutter/material.dart';
import 'package:smartgrid/screens/dashboard_screen.dart';

class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konto erstellen",
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
          const TextField(
            decoration: InputDecoration(
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
          const TextField(
            decoration: InputDecoration(
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
          const TextField(
            decoration: InputDecoration(
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
          const TextField(
            decoration: InputDecoration(
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
          const TextField(
            decoration: InputDecoration(
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
