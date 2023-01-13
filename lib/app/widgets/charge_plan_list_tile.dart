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
    return Card(
      child: ListTile(
        onTap: () => onTap(chargePlanEntity),
        trailing: Text("${chargePlanEntity.id}"),
        title: const Text("Ladeplan"),
        subtitle: Text(chargePlanEntity.device.description),
        leading: CircleAvatar(
          child: Icon(
            chargePlanEntity.status == "active"
                ? Icons.hourglass_empty
                : Icons.check,
          ),
        ),
      ),
    );
  }
}
