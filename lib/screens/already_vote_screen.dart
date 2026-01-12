import 'package:flutter/material.dart';

class AlreadyVoteScreen extends StatelessWidget {
  const AlreadyVoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Already Voted")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 64),
          const Text("Thank you for voting!"),
          const Text("Your vote has already been successfully recorded."),
          const Text("Results will be available after the election ends."),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Go to Dashboard")),
        ]),
      ),
    );
  }
}
