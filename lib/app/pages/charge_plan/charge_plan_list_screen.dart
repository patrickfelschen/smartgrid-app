import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_list_controller.dart';
import 'package:smartgrid/app/widgets/charge_plan_list_tile.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

import 'charge_plan_screen.dart';

class ChargePlanListScreen extends ConsumerWidget {
  const ChargePlanListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChargePlanEntity> plans = [];
    final AsyncValue<void> state = ref.watch(chargePlanListControllerProvider);

    ref.listen<AsyncValue>(chargePlanListControllerProvider, (_, state) {
      if (!state.isRefreshing && state.hasValue) {
        plans = state.value;
      }

      if (!state.isRefreshing && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error.toString())),
        );
      }
    });

    Widget loadingBody = const Center(
      child: CircularProgressIndicator(),
    );

    Widget list = ListView.builder(
      itemCount: plans.length,
      itemBuilder: ((context, index) {
        print("item builder");
        return ChargePlanListTile(
          onTap: (selected) {
            print(selected);
          },
          chargePlanEntity: plans[index],
        );
      }),
    );

    Widget listBody = ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      children: [
        const Icon(
          Icons.history,
          size: 200.0,
          color: Colors.green,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ChargePlanScreen(),
              ),
            );
          },
          leading: const CircleAvatar(
            child: Icon(Icons.timeline),
          ),
          title: const Text("Ladeplan"),
          subtitle: const Text("vom 01.12.2022"),
          trailing: const Text("Aktiv"),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ChargePlanScreen(),
              ),
            );
          },
          leading: const CircleAvatar(
            child: Icon(Icons.timeline),
          ),
          title: const Text("Ladeplan"),
          subtitle: const Text("vom 10.11.2022"),
          trailing: const Text("Fertig"),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladepläne"),
      ),
      body: !state.isRefreshing && state.hasValue ? list : loadingBody,
    );
  }
}
