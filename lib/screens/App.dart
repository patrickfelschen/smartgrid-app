import 'package:flutter/material.dart';
import 'package:smartgrid/screens/ChargePlanListScreen.dart';
import 'package:smartgrid/screens/ChargePlanScreen.dart';
import 'package:smartgrid/screens/ChargeRequestCreationScreen.dart';
import 'package:smartgrid/screens/DashboardScreen.dart';
import 'package:smartgrid/screens/DeviceCreationScreen.dart';
import 'package:smartgrid/screens/OptionScreen.dart';
import 'AccountCreationScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashboardScreen(),
    );
  }
}
