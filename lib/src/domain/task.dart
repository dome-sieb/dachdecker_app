import 'package:dachdecker_app/src/domain/worker.dart';

class Task {
  String title;
  String description;
  Worker worker;

  Task({required this.title, required this.description, required this.worker});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "worker": worker.toMap(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map["title"],
        description: map["description"],
        worker: map["worker"]);
  }

  factory Task.eigtheen(String title, String description, Worker worker) {
    return Task(title: title, description: description, worker: worker);
  }
}
