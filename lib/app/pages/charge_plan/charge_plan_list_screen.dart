import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_list_controller.dart';
import 'package:smartgrid/app/pages/charge_plan/charge_plan_screen.dart';
import 'package:smartgrid/app/widgets/charge_plan_list_tile.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanListScreen extends ConsumerWidget {
  const ChargePlanListScreen({super.key});

  void onPlanSelected(BuildContext context, ChargePlanEntity selected) {
    print(selected);
    Navigator.of(context).push(
      MaterialPageRoute<ChargePlanScreen>(
        builder: (_) => ChargePlanScreen(chargePlan: selected),
        fullscreenDialog: true,
      ),
    );
  }

  Widget onData(List<ChargePlanEntity> plans) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: plans.length,
      itemBuilder: ((context, index) {
        print("item builder");
        return ChargePlanListTile(
          onTap: (selected) => onPlanSelected(context, selected),
          chargePlanEntity: plans[index],
        );
      }),
    );
  }

  Widget onLoading() {
    print("loading");
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget onError(Object error, StackTrace stackTrace) {
    print(stackTrace);
    return const Center(
      child: Text(
        "Unerwartete Antwort vom Server!",
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    final AsyncValue state = ref.watch(chargePlanListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ladepläne"),
      ),
      body: state.when(
        data: (data) {
          List<ChargePlanEntity> plans = data;
          return onData(plans);
        },
        error: (error, stackTrace) {
          return onError(error, stackTrace);
        },
        loading: () {
          return onLoading();
        },
      ),
    );
  }
}
