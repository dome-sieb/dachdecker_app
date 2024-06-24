import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  DatabaseRepository databaseRepository = MockDatabase();
  databaseRepository.init();
  runApp(App(databaseRepository));
}
