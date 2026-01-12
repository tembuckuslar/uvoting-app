import 'package:flutter/material.dart';

class ResultPendingScreen extends StatelessWidget {
  const ResultPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results Not Available")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const Icon(Icons.hourglass_empty, size: 64),
          const Text("Results Not Available", style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("The election has ended, but results have not yet been published by the admin."),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Go to Dashboard")),
        ]),
      ),
    );
  }
}
