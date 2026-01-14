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
      body: Column(
        children: [
          const SizedBox(height: 24),

          // Logo placeholder
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(Icons.admin_panel_settings, size: 40, color: Colors.white),
          ),

          const SizedBox(height: 16),

          // Tagline
          const Text(
            "Empowering Elections, One Click at a Time",
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),

          const SizedBox(height: 24),

          // Grid of buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardButton(
                    context,
                    label: "Manage Positions",
                    icon: Icons.workspaces,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagePositionsScreen())),
                  ),
                  _buildDashboardButton(
                    context,
                    label: "Add Candidate",
                    icon: Icons.person_add,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddCandidateScreen())),
                  ),
                  _buildDashboardButton(
                    context,
                    label: "Election Control",
                    icon: Icons.settings_remote,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ElectionControlScreen(electionId: 'id'))),
                  ),
                  _buildDashboardButton(
                    context,
                    label: "Results Analytics",
                    icon: Icons.bar_chart,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen(electionId: "123"))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B3A57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.white),
          const SizedBox(height: 12),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

