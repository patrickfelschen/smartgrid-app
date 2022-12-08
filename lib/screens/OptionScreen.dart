import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartgrid/screens/AccountCreationScreen.dart';
import 'package:smartgrid/screens/DeviceCreationScreen.dart';

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
                  builder: (_) => const AccountCreationScreen(),
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
