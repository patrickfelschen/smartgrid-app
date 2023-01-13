import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartgrid/app/pages/authentication/auth_wrapper_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: kIsWeb ? 600.0 : double.infinity,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('de', ''), // German, no country code
          ],
          theme: ThemeData(
            primarySwatch: Colors.green,
            buttonTheme: const ButtonThemeData(height: 50.0),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(10, 50)),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(10, 50)),
              ),
            ),
            //useMaterial3: true,
            //colorSchemeSeed: Colors.green,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.green[900],
          ),
          themeMode: ThemeMode.light,
          home: const AuthWrapperScreen(),
        ),
      ),
    );
  }
}
