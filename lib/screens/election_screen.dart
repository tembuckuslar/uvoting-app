import 'package:flutter/material.dart';
import 'election_detailed_screen.dart';

class ElectionsScreen extends StatelessWidget {
  const ElectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example elections list (replace with API data later)
    final elections = [
      {"id": "1", "title": "Student President", "status": "ACTIVE"},
      {"id": "2", "title": "Sports Coordinator", "status": "ENDED"},
      {"id": "3", "title": "Cultural Secretary", "status": "ACTIVE"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Elections"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: elections.length,
        itemBuilder: (context, index) {
          final election = elections[index];
          final isActive = election["status"] == "ACTIVE";

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: ListTile(
              title: Text(
                election["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Status: ${election["status"]}"),
              trailing: Icon(
                isActive ? Icons.how_to_vote : Icons.bar_chart,
                color: isActive ? Colors.green : Colors.grey,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ElectionDetailScreen(
                      election: Map<String, String>.from(election),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
