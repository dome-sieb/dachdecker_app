import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class MockDatabase extends DatabaseRepository {
  List<Worker> workers = [];
  Buildingsite? buildingsite;

  void init() {
    workers = [Worker('1', 'Dome', 'Dachdecker'), Worker('2', 'Tom', 'Azubi')];
    buildingsite = Buildingsite(
      'test',
      'Fantasiestr. 4 12345 Fantasiestadt',
      'Herr Besitzer',
      workers,
      [
        Task(
          'Dämmen',
          'Vorhandene Konstruktion mit Dämmung ausfüllen',
          workers[0],
        ),
      ],
      ['Viel Spaß', "Frohes Schaffen!"],
    );
  }

  @override
  void addTask(Task task) {
    buildingsite?.task.add(task);
  }

  @override
  void addWorker(Worker worker) {
    buildingsite?.worker.add(worker);
  }

  @override
  List<String>? getMessages() {
    return buildingsite?.messages;
  }

  @override
  void removeTask(Task task) {
    buildingsite?.task.remove(task);
  }

  @override
  void removeWorker(Worker worker) {
    buildingsite?.worker.remove(worker);
  }

  @override
  void sendMessages(String message) {
    buildingsite?.messages.add(message);
  }

  @override
  Buildingsite? getBuildingsite() {
    return buildingsite;
  }

  @override
  List<Task>? getTasks() {
    return buildingsite?.task;
  }

  @override
  List<Worker>? getWorkers() {
    return buildingsite?.worker;
  }
}
