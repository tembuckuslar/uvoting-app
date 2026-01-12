import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Election Setup")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const Icon(Icons.settings, size: 64),
          const Text("ELECTION SETUP IN PROGRESS", style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("The election is being prepared."),
          const Text("Voting positions and candidates will appear once setup is complete."),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Go to Dashboard")),
        ]),
      ),
    );
  }
}
