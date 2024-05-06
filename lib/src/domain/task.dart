import 'package:dachdecker_app/src/domain/worker.dart';

class Task {
  String title;
  String description;
  Worker worker;
  Task(this.title, this.description, this.worker);
}
