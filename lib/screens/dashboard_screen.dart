import 'package:flutter/material.dart';
import 'election_detailed_screen.dart';
import 'result_screen.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elections = [
      {"id": "1", "title": "Student President", "status": "ACTIVE"},
      {"id": "2", "title": "Sports Coordinator", "status": "ENDED"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: handle logout
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Elections",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: elections.length,
                itemBuilder: (context, index) {
                  final election = elections[index];
                  final isActive = election["status"] == "ACTIVE";
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(election["title"]!),
                      subtitle: Text("Status: ${election["status"]}"),
                      trailing: isActive
                          ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ElectionDetailScreen(
                                election: Map<String, String>.from(election),
                              ),
                            ),
                          );
                        },
                        child: const Text("Vote"),
                      )
                          : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ResultScreen(electionId: "123"),
                            ),
                          );
                        },
                        child: const Text("View Results"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

