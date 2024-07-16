import 'package:firebase_auth/firebase_auth.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/loginscreen.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('signupScreen');

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : overviewKey,
            theme: ThemeData.from(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
            themeMode: ThemeMode.light,
            home: user == null ? const LoginScreen() : const SignUpScreen(),

            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }
}
