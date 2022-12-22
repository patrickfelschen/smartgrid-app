import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartgrid/utils/constants.dart';

import 'main_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox(Constants.authStorageKey); // auth
  runApp(const ProviderScope(child: MainApp()));
}
