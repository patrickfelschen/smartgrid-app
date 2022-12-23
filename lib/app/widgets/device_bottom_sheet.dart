import 'package:flutter/material.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceBottomSheet extends StatelessWidget {
  final List<DeviceEntity> devices;

  const DeviceBottomSheet({
    super.key,
    required this.devices,
    required this.onDeviceSelected,
  });

  final Function(DeviceEntity) onDeviceSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 350,
      child: ListView.builder(
        itemCount: devices.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          DeviceEntity e = devices[index];
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.electrical_services,
                size: 32,
                color: Colors.green,
              ),
              title: Text(e.description),
              subtitle: Text(e.maxPower.toString()),
              onTap: () {
                onDeviceSelected(e);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
