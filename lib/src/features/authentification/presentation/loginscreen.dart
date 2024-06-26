import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/welcom_screen.dart';
//import 'package:dachdecker_app/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const LoginScreen({
    super.key,
    required this.databaseRepository,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Herzlich Willkommen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                Center(child: Image.asset('assets/images/background.png')),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Passwort",
                    icon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Login"),
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  child: const Text("Noch keinen Account? Zur Registrierung"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
