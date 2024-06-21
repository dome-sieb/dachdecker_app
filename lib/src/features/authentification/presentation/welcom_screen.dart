import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const WelcomeScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willkommen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                Center(child: Image.asset('assets/images/background.png')),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
