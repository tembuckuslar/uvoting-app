import 'package:flutter/material.dart';
import 'manage_position_screen.dart';
import 'add_candidate_screen.dart';
import 'election_control_screen.dart';
import 'results _screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagePositionScreen())),
            child: const Text("Manage Positions"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddCandidateScreen())),
            child: const Text("Add Candidate"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ElectionControlScreen())),
            child: const Text("Election Control"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen())),
            child: const Text("Results Analytics"),
          ),
        ],
      ),
    );
  }
}
