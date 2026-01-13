import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String electionId;
  const ResultScreen({super.key, required this.electionId});

  @override
  Widget build(BuildContext context) {
    // Example static data
    final results = {"Alice": 60, "Bob": 40};

    return Scaffold(
      appBar: AppBar(title: Text("Results for $electionId")),
      body: ListView(
        children: results.entries.map((e) => ListTile(
          title: Text(e.key),
          trailing: Text("${e.value}%"),
        )).toList(),
      ),
    );
  }
}


