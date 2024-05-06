import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class Buildingsite {
  String name;
  String address;
  String owner;
  List<Worker> worker;
  List<Task> task;
  List<String> messages;

  Buildingsite(
    this.name,
    this.address,
    this.owner,
    this.worker,
    this.task,
    this.messages,
  );
}
