import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/building_material.dart';
import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/task.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

import 'package:flutter/src/foundation/key.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreDatabase(this._firebaseFirestore);

  @override
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
        .update(task.toMap());
  }

  @override
  Future<void> addWorker(Worker worker) {
    return _firebaseFirestore
        .collection('workers')
        .doc(worker.id)
        .update(worker.toMap());
  }

  @override
  Future<Buildingsite?> getBuildingsite(Key? key) {
    return _firebaseFirestore
        .collection('buildingSites')
        .doc(key)
        .get()
        .then((doc) => Buildingsite.fromMap(doc.data()));
  }

  @override
  Future<List<String>?> getMessages() async {
    return _firebaseFirestore.collection('messages').get().then((snapshot) =>
        snapshot.docs.map((doc) => doc.data()['message']).toList());
  }

  @override
  Future<List<Task>?> getTasks() {
    return _firebaseFirestore.collection('tasks').get().then((snapshot) =>
        snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList());
  }

  @override
  Future<List<Worker>?> getWorkers() {
    return _firebaseFirestore.collection('workers').get().then((snapshot) =>
        snapshot.docs.map((doc) => Worker.fromMap(doc.data())).toList());
  }

  @override
  void init() {
    // TODO: implement init
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
  Future<void> showWorker(Worker worker) {
    return _firebaseFirestore
        .collection('workers')
        .doc(worker.id)
        .get()
        .then((doc) => Worker.fromMap(doc.data()));
  }
}

@override
Future<Buildingsite> init() async {
  final buildingsite =
      await _firestoreFirebase.collection('buildingsites').doc('test').get();
  final workers = await _firestoreFirebase.collection('workers').get();
  final tasks = await _firestoreFirebase.collection('tasks').get();
  final buildingMaterials =
      await _firestoreFirebase.collection('buildingMaterials').get();
  final messages = await _firestoreFirebase.collection('messages').get();

  final List<Worker> workerList =
      workers.docs.map((worker) => Worker.fromMap(worker.data())).toList();
  final List<Task> taskList =
      tasks.docs.map((task) => Task.fromMap(task.data())).toList();
  final List<BuildingMaterial> buildingMaterialList = buildingMaterials.docs
      .map((buildingMaterial) =>
          BuildingMaterial.fromMap(buildingMaterial.data()))
      .toList();
  final List<String> messageList =
      messages.docs.map((message) => message.data()['message']).toList();

  return Buildingsite(
    name: buildingsite.id,
    address: buildingsite.data()['address'],
    owner: buildingsite.data()['owner'],
    worker: workerList,
    task: taskList,
    messages: messageList,
  );
}
