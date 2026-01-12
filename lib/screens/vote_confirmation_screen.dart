import 'package:flutter/material.dart';

class VoteConfirmationScreen extends StatelessWidget {
  const VoteConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Already Voted")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            const Text("Thank you for voting!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Your vote has already been successfully recorded."),
            const Text("Results will be available after the election ends."),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go to Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
