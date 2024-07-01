import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/loginscreen.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/signupscreen.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    MockDatabase databaseRepository = MockDatabase();
    databaseRepository.init();

    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('signupScreen');

    return StreamBuilder(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : overviewKey,

            themeMode: ThemeMode.light,
            home: user == null
                ? LoginScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
                  )
                : SignUpScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository),
            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }
}
