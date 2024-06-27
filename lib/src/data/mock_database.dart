import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/material.dart';

class MockDatabase implements DatabaseRepository {
  List<Worker> workers = [];
  Buildingsite? buildingsite;

  @override
  Future<void> init() async {
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

  void show(Worker worker) {}
}
