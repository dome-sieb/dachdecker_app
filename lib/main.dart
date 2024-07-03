import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/firebase_options.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/firestore_database.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/data/auth_repository.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //DatabaseRepository databaseRepository = MockDatabase();
  DatabaseRepository databaseRepository =
      FirestoreDatabase(FirebaseFirestore.instance);

  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(App(
    databaseRepository: databaseRepository,
    authRepository: authRepository,
  ));
}
