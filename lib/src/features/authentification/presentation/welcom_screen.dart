import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class WelcomeScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const WelcomeScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
        title: const Text('Willkommen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    Center(child: Image.asset('assets/images/background.png')),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OverviewScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Willkommen in meiner App!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
