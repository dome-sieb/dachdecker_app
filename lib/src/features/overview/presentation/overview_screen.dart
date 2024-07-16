import 'package:dachdecker_app/src/data/auth_repository.dart';
import 'package:dachdecker_app/src/data/database_repository.dart' as db;
import 'package:dachdecker_app/src/data/mock_database.dart' as mock;
import 'package:dachdecker_app/src/data/mock_database.dart';
import 'package:dachdecker_app/src/domain/worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late Future<List<Worker>?> workers;

  @override
  void initState() {
    super.initState();
    workers = context.read<DatabaseRepository>().getWorkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Worker'),
          backgroundColor: Colors.red[400],
          actions: [
            IconButton(
              onPressed: () async {
                await context.read<AuthRepository>().logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: FutureBuilder<List<Worker>>(
          future: workers as Future<List<Worker>>?,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error occurred'),
              );
            } else {
              final workers = snapshot.data!;
              return ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return ListTile(
                    title: Text(worker.name),
                    subtitle: Text(worker.position),
                  );
                },
              );
            }
          },
        ));
  }
}
