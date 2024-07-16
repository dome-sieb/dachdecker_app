/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/firebase_options.dart';
import 'package:dachdecker_app/src/data/database_repository.dart' as db_repo;
import 'package:dachdecker_app/src/data/firestore_database.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:provider/provider.dart';

import 'package:dachdecker_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  DatabaseRepository databaseRepository = FirestoreDatabase(FirebaseFirestore.instance);

  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
        create: (_) => databaseRepository,
      ),
      Provider<AuthRepository>(
        create: (_) => authRepository,
      ),
    ],
    child: const App(),
      ),
  );
}*/

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/firebase_options.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/firestore_database.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:provider/provider.dart';

import 'package:dachdecker_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestoreInstance = FirebaseFirestore.instance;
  final firebaseAuthInstance = FirebaseAuth.instance;

  final databaseRepository = FirestoreDatabase(firestoreInstance);
  final authRepository = AuthRepository(firebaseAuthInstance);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        ChangeNotifierProvider<AuthRepository>(
          create: (_) => authRepository,
        ),
      ],
      child: const App(),
    ),
  );
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/firebase_options.dart';
import 'package:dachdecker_app/src/data/database_repository.dart'
    as database_repo;
import 'package:dachdecker_app/src/data/firestore_database.dart';
import 'package:dachdecker_app/src/data/mock_database.dart' as mock_db;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:provider/provider.dart';

import 'package:dachdecker_app/src/app.dart';

class AuthRepository with ChangeNotifier {
  AuthRepository(
      FirebaseAuth
          firebaseAuthInstance); // Make sure AuthRepository extends ChangeNotifier
  // ...
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestoreInstance = FirebaseFirestore.instance;
  final firebaseAuthInstance = FirebaseAuth.instance;

  final databaseRepository = FirestoreDatabase(firestoreInstance);
  final authRepository = AuthRepository(firebaseAuthInstance);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<database_repo.DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        ChangeNotifierProvider<AuthRepository>(
          create: (_) => authRepository,
        ),
      ],
      child: const App(),
    ),
  );
}
