import 'package:flutter/material.dart';
import 'package:smartgrid/app/pages/authentication/customer_sign_in_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CustomerSignInScreen(),
    );
  }
}
