import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/foundation.dart';

abstract class DatabaseRepository {
  Future<void> sendMessages(String message);
  Future<List<String>?> getMessages();
  Future<void> addWorker(Worker worker);
  Future<void> removeWorker(Worker worker);
  Future<void> addTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> showWorker(Worker worker);
  Future<List<Worker>?> getWorkers();
  Future<List<Task>?> getTasks();
  Future<Buildingsite?> getBuildingsite(Key? key);

  void init() {}
}
