import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:dachdecker_app/src/data/database_repository.dart' as dbRepo;
import 'package:dachdecker_app/src/data/firestore_database.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/loginscreen.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/signupscreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove the following line since the databaseRepository is already defined in the constructor
    // MockDatabase databaseRepository = MockDatabase();

    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('signupScreen');

    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : overviewKey,

            themeMode: ThemeMode.light,
            home: user == null ? LoginScreen() : SignUpScreen(),

            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }
}
