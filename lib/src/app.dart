import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    MockDatabase();

    return MaterialApp(
      title: 'Dachdecker App',
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
    );
  }
}
