import 'package:flutter/material.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceBottomSheet extends StatelessWidget {
  List<DeviceEntity> devices;

  DeviceBottomSheet({
    super.key,
    required this.devices,
    required this.onDeviceSelected,
  }) {
    print(devices);
  }

  final Function(DeviceEntity) onDeviceSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 300,
      child: ListView(
          padding: const EdgeInsets.all(5),
          children: devices
              .map((e) => Card(
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
                  ))
              .toList()),
    );
  }
}
