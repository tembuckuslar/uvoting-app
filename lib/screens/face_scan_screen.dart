import 'package:flutter/material.dart';
import '../api.dart';
import 'vote_confirmation_screen.dart';
import 'already_vote_screen.dart';

class FaceScanScreen extends StatelessWidget {
  final String candidate;
  const FaceScanScreen({super.key, required this.candidate});

  void _cast(BuildContext context) async {
    final success = await castVote(candidate);
    if (!context.mounted) return;

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const VoteConfirmationScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AlreadyVoteScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face Scan")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _cast(context),
          child: const Text("Cast Vote"),
        ),
      ),
    );
  }
}
