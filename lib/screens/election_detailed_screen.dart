import 'package:flutter/material.dart';
import 'candidate_screen.dart';

class ElectionDetailScreen extends StatelessWidget {
  final Map<String, String> election;
  const ElectionDetailScreen({super.key, required this.election});

  @override
  Widget build(BuildContext context) {
    final candidates = [
      {"name": "Alice Johnson", "party": "Unity Party"},
      {"name": "Bob Smith", "party": "Progressive Front"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(election["title"] ?? "Election")),
      body: ListView(
        children: candidates.map((c) {
          return Card(
            child: ListTile(
              title: Text(c["name"]!),
              subtitle: Text("Party: ${c["party"]}"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CandidateScreen(candidate: c["name"]!),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
