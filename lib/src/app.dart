import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/features/overview/presentation/overview_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build (BuildContext context) {
    DatabaseRepository databaseRepository = MockDatabase();

    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.light);
      home: OverviewScreen(databaseRepository: databaseRepository);
  
      