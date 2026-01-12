import 'package:flutter/material.dart';
import 'election_detail_screen.dart';

class ElectionsScreen extends StatelessWidget {
  const ElectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elections = [
      {"id": "1", "title": "Student Union Election", "status": "ACTIVE"},
      {"id": "2", "title": "Class Representative", "status": "SETUP"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Elections")),
      body: ListView(
        children: elections.map((el) {
          return ListTile(
            title: Text(el["title"]!),
            subtitle: Text("Status: ${el["status"]}"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ElectionDetailScreen(election: el)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
