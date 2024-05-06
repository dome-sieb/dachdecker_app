import 'package:dachdecker_app/src/domain/buildingsite.dart';
import 'package:dachdecker_app/src/domain/worker.dart';

class MockDatabase implements Repository {
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
}
