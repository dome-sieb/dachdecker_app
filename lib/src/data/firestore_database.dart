import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/building_material.dart';
import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/foundation.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  Future<List<Buildingsite>> getBuildingsites() async {
    final snapshot = await _firebaseFirestore.collection('buildingSites').get();
    return snapshot.docs
        .map((doc) => Buildingsite.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<void> addTask(Task task) async {
    return _firebaseFirestore
        .collection('tasks')
        .doc(task.title)
        .set(task.toMap());
  }

  @override
  Future<void> addWorker(Worker worker) {
    return _firebaseFirestore
        .collection('workers')
        .doc(worker.id)
        .set(worker.toMap());
  }

  @override
  Future<Buildingsite?> getBuildingsite(Key? key) {
    String? keyString = key?.toString();
    return _firebaseFirestore
        .collection('buildingSites')
        .doc(keyString)
        .get()
        .then((doc) => Buildingsite.fromMap(doc.data() ?? {}));
  }

  @override
  Future<List<String>?> getMessages() async {
    final snapshot = await _firebaseFirestore.collection('messages').get();
    return snapshot.docs.map((doc) => doc.data()['message'] as String).toList();
  }

  @override
  Future<List<Task>?> getTasks() async {
    final snapshot = await _firebaseFirestore.collection('tasks').get();
    return snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
  }

  @override
  Future<List<Worker>?> getWorkers() async {
    final snapshot = await _firebaseFirestore.collection('workers').get();
    return snapshot.docs.map((doc) => Worker.fromMap(doc.data())).toList();
  }

  @override
  Future<void> init() async {
    // Implementierung der init-Methode falls erforderlich
  }

  @override
  Future<void> removeTask(Task task) {
    return _firebaseFirestore.collection('tasks').doc(task.title).delete();
  }

  @override
  Future<void> removeWorker(Worker worker) {
    return _firebaseFirestore.collection('workers').doc(worker.id).delete();
  }

  @override
  Future<void> sendMessages(String message) {
    return _firebaseFirestore.collection('messages').add({'message': message});
  }

  @override
  Future<Worker> showWorker(Worker worker) async {
    final doc =
        await _firebaseFirestore.collection('workers').doc(worker.id).get();
    return Worker.fromMap(doc.data() ?? {});
  }

  Future<Buildingsite> initBuildingsite(String id) async {
    final buildingsiteDoc =
        await _firebaseFirestore.collection('buildingSites').doc(id).get();
    final workersSnapshot =
        await _firebaseFirestore.collection('workers').get();
    final tasksSnapshot = await _firebaseFirestore.collection('tasks').get();
    final buildingMaterialsSnapshot =
        await _firebaseFirestore.collection('buildingMaterials').get();
    final messagesSnapshot =
        await _firebaseFirestore.collection('messages').get();

    final List<Worker> workerList = workersSnapshot.docs
        .map((worker) => Worker.fromMap(worker.data()))
        .toList();
    final List<Task> taskList =
        tasksSnapshot.docs.map((task) => Task.fromMap(task.data())).toList();
    final List<BuildingMaterial> buildingMaterialList =
        buildingMaterialsSnapshot.docs
            .map((buildingMaterial) =>
                BuildingMaterial.fromMap(buildingMaterial.data()))
            .toList();
    final List<String> messageList = messagesSnapshot.docs
        .map((message) => message.data()['message'] as String)
        .toList();

    return Buildingsite(
      name: buildingsiteDoc.data()?['name'] ?? '',
      address: buildingsiteDoc.data()?['address'] ?? '',
      owner: buildingsiteDoc.data()?['owner'] ?? '',
      worker: workerList,
      tasks: taskList,
      messages: messageList,
      task: buildingsiteDoc.data()?['task'] ?? '',
    );
  }
}
