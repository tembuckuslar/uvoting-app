import 'package:flutter/material.dart';

class ResultsAnalyticsScreen extends StatelessWidget {
  const ResultsAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example static data
    final results = {"Alice": 60, "Bob": 40};
    return Scaffold(
      appBar: AppBar(title: const Text("Results Analytics")),
      body: ListView(
        children: results.entries.map((e) => ListTile(
          title: Text(e.key),
          trailing: Text("${e.value}%"),
        )).toList(),
      ),
    );
  }
}
