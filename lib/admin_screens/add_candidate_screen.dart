import 'package:flutter/material.dart';

class AddCandidateScreen extends StatelessWidget {
  const AddCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final posCtrl = TextEditingController();
    final manifestoCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Candidate")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Candidate Name
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: "Candidate Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Position
            TextField(
              controller: posCtrl,
              decoration: const InputDecoration(
                labelText: "Position",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Manifesto
            TextField(
              controller: manifestoCtrl,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Manifesto/Vision",
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Enter candidate's goals, promises, and vision...",
              ),
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final name = nameCtrl.text;
                  final position = posCtrl.text;
                  final manifesto = manifestoCtrl.text;

                  // For now, just show a snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saved: $name for $position")),
                  );

                  // TODO: Send data to backend or database
                },
                child: const Text("Save Candidate"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

