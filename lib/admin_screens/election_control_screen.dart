import 'package:flutter/material.dart';

class ElectionControlScreen extends StatefulWidget {
  final String electionId;
  const ElectionControlScreen({super.key, required this.electionId});

  @override
  State<ElectionControlScreen> createState() => _ElectionControlScreenState();
}

class _ElectionControlScreenState extends State<ElectionControlScreen> {
  // Example positions
  final List<Map<String, dynamic>> positions = [
    {"id": "1", "title": "Student President", "status": "PENDING"},
    {"id": "2", "title": "Sports Coordinator", "status": "ACTIVE"},
    {"id": "3", "title": "Treasurer", "status": "ENDED"},
  ];

  /// ✅ Start election for a position
  Future<void> adminStart(String positionId) async {
    setState(() {
      positions.firstWhere((p) => p["id"] == positionId)["status"] = "STARTING";
    });
    await Future.delayed(const Duration(seconds: 2)); // simulate backend call
    setState(() {
      positions.firstWhere((p) => p["id"] == positionId)["status"] = "ACTIVE";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Election for $positionId started successfully!")),
    );
  }

  /// ✅ End election for a position
  Future<void> adminEnd(String positionId) async {
    setState(() {
      positions.firstWhere((p) => p["id"] == positionId)["status"] = "ENDING";
    });
    await Future.delayed(const Duration(seconds: 2)); // simulate backend call
    setState(() {
      positions.firstWhere((p) => p["id"] == positionId)["status"] = "ENDED";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Election for $positionId ended successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Election Control")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: positions.length,
        itemBuilder: (context, index) {
          final position = positions[index];
          final status = position["status"];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(position["title"],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Status: $status"),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // ✅ Start button green
                        ),
                        onPressed: status == "PENDING"
                            ? () => adminStart(position["id"])
                            : null,
                        child: const Text("Start"),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // ✅ End button red
                        ),
                        onPressed: status == "ACTIVE"
                            ? () => adminEnd(position["id"])
                            : null,
                        child: const Text("End"),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
