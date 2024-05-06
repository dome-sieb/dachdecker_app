import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/loginscreen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    MockDatabase databaseRepository = MockDatabase();
    databaseRepository.init();

    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      themeMode: ThemeMode.light,
      home: LoginScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
