import 'package:flutter/material.dart';

class MockDatabase implements DatabaseRepository {
  List<Worker> workers = [];
  Buildingsite? buildingsite;

  @override
  Future<void> init() async {
    workers = [
      Worker(id: '1', name: 'Dome', position: 'Dachdecker'),
      Worker(id: '2', name: 'Max', position: 'Azubi'),
    ];
    buildingsite = Buildingsite(
      siteName:
          'Karstadt Dresden', // Hinzugefügtes fehlendes positionsabhängiges Argument
      address: 'Prager Straße 10, 01069 Dresden',
      worker: [Worker(id: '1', name: 'Dome', position: 'Dachdecker')],
      task: [
        Task(
          title: 'Dämmen',
          description: 'Vorhandene Konstruktion mit Dämmung ausfüllen',
          worker: workers[0],
        ),
        Task(
          title: 'Decken',
          description: 'Dachdecken mit Schindeln',
          worker: workers[0],
        ),
      ],
      owner: 'Karstadt Dresden',
      messages: ['Viel Spaß', 'Frohes Schaffen!'],
    );
  }

  @override
  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 3));
    buildingsite?.task.add(task);
  }

  @override
  Future<void> addWorker(Worker worker) async {
    await Future.delayed(const Duration(seconds: 3));
    buildingsite?.worker.add(worker);
  }

  @override
  Future<List<String>?> getMessages() async {
    await Future.delayed(const Duration(seconds: 3));
    return buildingsite?.messages;
  }

  @override
  Future<void> removeTask(Task task) async {
    await Future.delayed(const Duration(seconds: 3));
    buildingsite?.task.remove(task);
  }

  @override
  Future<void> removeWorker(Worker worker) async {
    await Future.delayed(const Duration(seconds: 3));
    buildingsite?.worker.remove(worker);
  }

  @override
  Future<void> sendMessages(String message) async {
    await Future.delayed(const Duration(seconds: 3));
    buildingsite?.messages.add(message);
  }

  @override
  Future<Buildingsite?> getBuildingsite(Key? key) async {
    await Future.delayed(const Duration(seconds: 3));
    return buildingsite;
  }

  @override
  Future<List<Task>?> getTasks() async {
    await Future.delayed(const Duration(seconds: 3));
    return buildingsite?.task;
  }

  @override
  Future<List<Worker>?> getWorkers() async {
    await Future.delayed(const Duration(seconds: 3));
    return buildingsite?.worker;
  }

  @override
  Future<void> showWorker(Worker worker) async {
    await Future.delayed(const Duration(seconds: 3));
    show(worker);
  }

  void show(Worker worker) {
    // Implementiere die gewünschte Logik hier
    print('Showing worker: ${worker.name}');
  }
}

// Beispielhafte Klassen für Worker, Task, Buildingsite und DatabaseRepository
class Worker {
  final String id;
  final String name;
  final String position;

  Worker({required this.id, required this.name, required this.position});
}

class Task {
  final String title;
  final String description;
  final Worker worker;

  Task({required this.title, required this.description, required this.worker});
}

class Buildingsite {
  final String siteName;
  final String address;
  final List<Worker> worker;
  final List<Task> task;
  final String owner;
  final List<String> messages;

  Buildingsite({
    required this.siteName,
    required this.address,
    required this.worker,
    required this.task,
    required this.owner,
    required this.messages,
  });
}

abstract class DatabaseRepository {
  Future<void> init();
  Future<void> addTask(Task task);
  Future<void> addWorker(Worker worker);
  Future<List<String>?> getMessages();
  Future<void> removeTask(Task task);
  Future<void> removeWorker(Worker worker);
  Future<void> sendMessages(String message);
  Future<Buildingsite?> getBuildingsite(Key? key);
  Future<List<Task>?> getTasks();
  Future<List<Worker>?> getWorkers();
  Future<void> showWorker(Worker worker);
}
