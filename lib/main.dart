import 'package:dachdecker_app/firebase_options.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseRepository databaseRepository = MockDatabase();
  databaseRepository.init();
  runApp(App(databaseRepository));
}
