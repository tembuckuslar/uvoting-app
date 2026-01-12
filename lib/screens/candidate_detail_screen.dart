import 'package:flutter/material.dart';
import 'verify_identity_screen.dart';

class CandidateScreen extends StatelessWidget {
  final String candidate;
  const CandidateScreen({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(candidate)),
      body: Center(
        child: ElevatedButton(
          child: const Text("Vote Now"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => VerifyIdentityScreen(candidate: candidate)),
          ),
        ),
      ),
    );
  }
}
