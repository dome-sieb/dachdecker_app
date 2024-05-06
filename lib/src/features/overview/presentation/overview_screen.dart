import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const OverviewScreen({super.key, required this.databaseRepository});
  @override
  Widget build(BuildContext context) {
    if (databaseRepository.getWorkers()!.isEmpty) {
      return const Center(
        child: Text('No workers'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker'),
        backgroundColor: Colors.red[400],
      ),
      body: ListView.builder(
        itemCount: databaseRepository.getWorkers()!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(databaseRepository.getWorkers()![index].name),
            subtitle: Text(databaseRepository.getWorkers()![index].position),

            /*  trailing: Text(
              databaseRepository.getWorkers()![index].salary.toString(),
            ),*/
          );
        },
      ),
    );
  }
}                //    