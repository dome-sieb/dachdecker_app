import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/src/foundation/key.dart';

abstract class DatabaseRepository {
  void sendMessages(String message);
  Future<List<String>?> getMessages();
  void addWorker(Worker worker);
  void removeWorker(Worker worker);
  void addTask(Task task);
  void removeTask(Task task);
  void showWorker(Worker worker);
  Future<List<Worker>?> getWorkers();
  Future<List<Task>?> getTasks();
  Future<Buildingsite?> getBuildingsite(Key? key);

  void init() {}
}
