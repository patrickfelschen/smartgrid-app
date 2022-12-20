import 'package:flutter/material.dart';

import '../authentication/customer_creation_screen.dart';
import '../device/device_creation_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Optionen"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CustomerCreationScreen(),
                ),
              );
            },
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text("Konto"),
            subtitle: const Text("Verwalte deine Kontoeinstellungen."),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const DeviceCreationScreen(),
                ),
              );
            },
            leading: const CircleAvatar(
              child: Icon(Icons.electrical_services),
            ),
            title: const Text("Geräte Profil"),
            subtitle: const Text("Verwalte deine Geräteprofile."),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const CircleAvatar(
              child: Icon(Icons.logout),
            ),
            title: const Text("Abmelden"),
            subtitle: const Text("Melde dich von deinem Konto ab."),
          ),
        ],
      ),
    );
  }
}
