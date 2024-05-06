import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/features/authentification/presentation/loginscreen.dart';
import 'package:flutter/material.dart;



import 'package:flutter/rendering.dart';class SignUpScreen extends StatefulWidget {
  final WorkerRepository databaseRepository;

  const SignUpScreen({super.key, required this.databaseRepository});
      

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrierung'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                Center(child: Assets.image('dachdecker-zunftwappen-zunftzeichen-tasse.jpeg')),
                const SizedBox(height: 32),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Benutzername',
                    icon: Icon(Icons.user),
                  ),  
                ),
                const SizedBox(height: 32),
                TextFormField(
                  abscureText: !showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    lableText: "Passwort",
                    icon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility_off) 
                          : const Icon(Icons.visibility_off),                      
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    lableText: "Passwort wiederholen",
                    icon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState (() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility_off) 
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    //TODO: registrieungslogik einbauen
                    // nach der registrierung 
                    //navigiere zur übersichtsseite
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Registrieren"),
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
                        builder: (context) => const LoginScreen(
                          workerbaseRepository: widget.databaseRepository,
                        ),
                      ));
                  },
                  child: const Text("Bereits registriert? Hier anmelden"),             
                ),
              ],  
            ),
          ),
        ),    
      ),
    );
  }  
}
