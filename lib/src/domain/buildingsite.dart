import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class Buildingsite {
  String name;
  String address;
  String owner;
  List<Worker> worker;
  List<Task> task;
  List<String> messages;

  var tasks;

  Buildingsite({
    required this.name,
    required this.address,
    required this.owner,
    required this.worker,
    required this.task,
    required this.messages,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "owner": owner,
      "worker": worker.map((e) => e.toMap()).toList(),
      "task": task.map((e) => e.toMap()).toList(),
      "messages": messages,
    };
  }

  factory Buildingsite.fromMap(Map<String, dynamic> map) {
    return Buildingsite(
      name: map["name"],
      address: map["address"],
      owner: map["owner"],
      worker: map["worker"],
      tasks: map["task"],
      messages: map["messages"],
      task: map["task"],
    );
  }

  factory Buildingsite.eigtheen(
    String name,
    String address,
    String owner,
    List<Worker> worker,
    List<Task> task,
    List<String> messages,
  ) {
    return Buildingsite(
      name: name,
      address: address,
      owner: owner,
      worker: worker,
      tasks: task,
      messages: messages,
      task: task,
    );
  }
}
