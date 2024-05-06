import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/building_material.dart';
import 'package:dachdecker_app/src/domain/task.dart';

class MockDatabase implements DatabaseRepository {
  List<Buildingsite> buildingsites = _createMockBuildingsites();
  List<Worker> workers = _createMockWorkers();

  @override
  List<Buildingsite> getBuildingsites() {
    return buildingsites;
  }

  @override
  List<Worker> getWorkers() {
    return workers;
  }

  @override
  void addBuildingsite(Buildingsite buildingsite) {
    buildingsites.add(buildingsite);
  }

  @override
  void addWorker(Worker worker) {
    workers.add(worker);
  }

  @override
  void addTask(Task task) {
    task.add(task);
  }

  @override
  void addBuildingMaterial(BuildingMaterial buildingMaterial) {
    buildingMaterial.add(buildingMaterial);
  }
}
