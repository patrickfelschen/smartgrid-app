import 'package:flutter/material.dart';
import 'package:smartgrid/domain/entities/charge_plan_entity.dart';

class ChargePlanListTile extends StatelessWidget {
  const ChargePlanListTile({
    super.key,
    required this.onTap,
    required this.chargePlanEntity,
  });

  final void Function(ChargePlanEntity selected) onTap;
  final ChargePlanEntity chargePlanEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(chargePlanEntity),
      leading: const CircleAvatar(
        child: Icon(Icons.timeline),
      ),
      title: const Text("Ladeplan"),
      subtitle: Text(chargePlanEntity.device.description),
      trailing: chargePlanEntity.status.contains("active")
          ? const Text("Aktiv")
          : null,
    );
  }
}
