import 'package:dachdecker_app/src/data/database_repository.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const OverviewScreen({super.key, required this.databaseRepository});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Worker>?>(
      future: databaseRepository.getWorkers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No workers'),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Worker'),
              backgroundColor: Colors.red[400],
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].position),
                );
              },
            ),
          );
        }
      },
    );
  }
}
