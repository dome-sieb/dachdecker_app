import '../../../data/database_repository.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  final WorkerRepository databaseRepository;

  const OverviewScreen({super.key, required this.databaseRepository});
  @override
  Widget build(BuildContext context) {
    List<Worker> worker = databaseRepository.listWorker();
    if (worker.isEmpty) {
      return const Center(
        child: Text('No workers'),
      );
    }
    return ListView.builder(
      itemCount: worker.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(worker[index].name),
          subtitle: Text(worker[index].position),
          trailing: Text(worker[index].salary.toString());
        }
      );
    }
}                //    