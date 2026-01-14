import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Ensure go_router is imported
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
      backgroundColor: const Color(0xFF87CEEB), // Light blue background
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1B3A57),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/login'), // Using go_router
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Election Status",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B3A57),
                      ),
                    ),
                    const Text(
                      "Live Election",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6C7A89),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Quick Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2ECC71)),
                onPressed: () => context.go('/voter/elections'),
                child: const Text("Go to All Elections", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2ECC71)),
                onPressed: () => context.go('/voter/results'),
                child: const Text("View Final Results", style: TextStyle(color: Colors.white)),

              ),
            ),

            const SizedBox(height: 32),
            const Text(
              "Your Elections",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // List Section
            Expanded(
              child: ListView.builder(
                itemCount: elections.length,
                itemBuilder: (context, index) {
                  final election = elections[index];
                  final isActive = election["status"] == "ACTIVE";
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: Text(
                        election["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Status: ${election["status"]}"),
                      trailing: isActive
                          ? ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                        child: const Text("Vote", style: TextStyle(color: Colors.white)),
                      )
                          : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultScreen(electionId: election["id"]!),
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

