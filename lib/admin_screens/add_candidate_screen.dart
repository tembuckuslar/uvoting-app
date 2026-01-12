import 'package:flutter/material.dart';

class AddCandidateScreen extends StatelessWidget {
  const AddCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final posCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Add Candidate")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Candidate Name")),
          TextField(controller: posCtrl, decoration: const InputDecoration(labelText: "Position")),
          ElevatedButton(onPressed: () {}, child: const Text("Save Candidate")),
        ]),
      ),
    );
  }
}
