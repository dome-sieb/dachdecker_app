import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/sign_up_screen.dart';
import 'package:dachdecker_app/src/features/overview/presentation/overview_screen.dart';

class Loginscreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const Loginscreen({super.key, required this.databaseRepository});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: const Column(
              children: [
                Center(child:Image.asset(assets/images/background.png)),
               SizedBox(height: 40),
               TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    labelText: "Passwort",
                    icon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    //TODO: login logik einbauen
                  }
                
  }
  }
