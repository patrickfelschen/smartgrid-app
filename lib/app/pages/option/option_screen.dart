import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/providers/auth_provider.dart';

import '../authentication/sign_up_screen.dart';
import '../device/device_update_screen.dart';

class OptionScreen extends ConsumerWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void signOut() async {
      Navigator.of(context).pop();
      ref.read(authNotifierProvider.notifier).signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Optionen"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SignUpScreen(),
                  ),
                );
              },
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("Konto"),
              subtitle: const Text("Verwalte deine Kontoeinstellungen."),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DeviceUpdateScreen(),
                  ),
                );
              },
              leading: const CircleAvatar(
                child: Icon(Icons.electrical_services),
              ),
              title: const Text("Geräte Profil"),
              subtitle: const Text("Verwalte deine Geräteprofile."),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(),
          Card(
            child: ListTile(
              onTap: () => signOut(),
              leading: const CircleAvatar(
                child: Icon(Icons.logout),
              ),
              title: const Text("Abmelden"),
              subtitle: const Text("Melde dich von deinem Konto ab."),
            ),
          ),
        ],
      ),
    );
  }
}
