/*
abstract class DatabaseRepository {
  void sendMessages(String message);
  List<String> getMessages();
  void changeWorker(String worker);
  List<String> changeWorker();
  void changeBuildingsite(String buildingsite);
  List<String> changeBuildingsite();
}
*/

import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class WorkerRepository {
  static List<Worker> workers = [
    Worker('1', 'Dominique', 'Dachdecker'),
    Worker('2', 'Tom', 'Meister'),
  ];

  static List<Worker> getAllWorkers() {
    return workers;
  }

  //static Worker getWorkerById(int id) {
  //return workers.firstWhere((worker) => worker.id == id);
}
//}

class buildingsiteRepository {
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
}
