import 'package:flutter/material.dart';
import 'verify_identity_screen.dart';

class CandidateScreen extends StatelessWidget {
  final String candidate;
  const CandidateScreen({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(candidate)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person)),
            const SizedBox(height: 16),
            Text(candidate, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Party: Example Party"),
            const SizedBox(height: 16),
            const Text("Manifesto: Improve student welfare, increase transparency."),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VerifyIdentityScreen(candidate: candidate)),
                );
              },
              child: const Text("Vote for this Candidate"),
            ),
          ],
        ),
      ),
    );
  }
}
