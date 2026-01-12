import 'package:flutter/material.dart';
import '../api.dart';

class ResultsScreen extends StatefulWidget {
  final String electionId;
  const ResultsScreen({super.key, required this.electionId});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool loading = true;
  Map<String, dynamic>? results;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      // Use real API call
      final data = await getFinalResult(widget.electionId);

      // Or use mock data for now:
      // final data = await getMockFinalResult(widget.electionId);

      setState(() {
        results = data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load results: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (results == null) {
      return const Scaffold(
        body: Center(child: Text("No results available")),
      );
    }

    final votes = results!["votes"] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: const Text("Election Results")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Winner: ${results!["winner"]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Votes:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            ...votes.entries.map((entry) => Text(
              "${entry.key}: ${entry.value}",
              style: const TextStyle(fontSize: 16),
            )),
          ],
        ),
      ),
    );
  }
}


