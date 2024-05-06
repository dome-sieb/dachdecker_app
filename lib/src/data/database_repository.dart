import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

abstract class DatabaseRepository {
  void sendMessages(String message);
  List<String>? getMessages();
  void addWorker(Worker worker);
  void removeWorker(Worker worker);
  void addTask(Task task);
  void removeTask(Task task);
  List<Worker>? getWorkers();
  List<Task>? getTasks();
  Buildingsite? getBuildingsite();
}

/*
import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class WorkerRepository {
  static List<Worker> workers = [
    Worker('w1', 'Dominique', 'Dachdecker'),
    Worker('w2', 'Tom', 'Meister'),
  ];

  Type get isEmpty => Null;

  get length => null;

  static List<Worker> getAllWorkers() {
    return workers;
  }

  static Worker getWorkerById(int id) {
    // ignore: unrelated_type_equality_checks
    return workers.firstWhere((worker) => worker.id == id);
  }
}

class BuildingsiteRepository {
  static List<Buildingsite> buildingsites = [
    Buildingsite('Kaufhaus', 'Pragerstr. 124 Dresden', 'Karstadt')
  ];

  static List<Buildingsite> getAllBuildingsites() {
    return buildingsites;
  }
}

class TaskRepository {
  static List<Task> tasks = [
    Task('abreissen', 'Alles alte abreißen bis auf Rohbau'),
    Task('dämmen altbau', 'vorhandene Dachkonstruktion ausdämmen'),
    Task('dämmen neubau', 'dämmen von neugebauter Konstruktion'),
    Task('einlatten', 'Dachlatten auf Konterlatten schießen'),
  ];

  static List<Task> getAllTasks() {
    return tasks;
  }
}*/
