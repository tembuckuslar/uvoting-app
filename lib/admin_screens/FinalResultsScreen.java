import 'package:flutter/material.dart';

class FinalResultsScreen extends StatelessWidget {
  const FinalResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final results = {"Alice": 120, "Bob": 80};
    return Scaffold(
      appBar: AppBar(title: const Text("Final Results")),
      body: Column(children: [
        const Text("Election Results", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ...results.entries.map((e) => ListTile(title: Text(e.key), trailing: Text("${e.value} votes"))),
        ElevatedButton(onPressed: () {}, child: const Text("Publish Results")),
      ]),
    );
  }
}
