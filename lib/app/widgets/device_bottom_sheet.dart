import 'package:flutter/material.dart';
import 'package:smartgrid/domain/entities/device_entity.dart';

class DeviceBottomSheet extends StatelessWidget {
  List<DeviceEntity> devices;

  DeviceBottomSheet({super.key, required this.devices}) {
    print(devices);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 300,
    );
  }
}
