import 'package:flutter/material.dart';
import '../../api.dart';

class FinalResultsScreen extends StatefulWidget {
  final String electionId;
  const FinalResultsScreen({super.key, required this.electionId});

  @override
  State<FinalResultsScreen> createState() => _FinalResultsScreenState();
}

class _FinalResultsScreenState extends State<FinalResultsScreen> {
  Map<String, dynamic>? results;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      final data = await getFinalResults(widget.electionId);
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

  Future<void> _publishResults() async {
    try {
      await adminPublish(widget.electionId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Results Published Successfully")),
      );
      // reload results to reflect published state
      _loadResults();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Publish failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (results == null || results!['message'] == 'Results not available') {
      return Scaffold(
        appBar: AppBar(title: const Text("Final Results")),
        body: Center(
          child: ElevatedButton(
            onPressed: _publishResults,
            child: const Text("Publish Results"),
          ),
        ),
      );
    }

    final positions = List<Map<String, dynamic>>.from(results!['positions']);
    return Scaffold(
      appBar: AppBar(title: const Text("Final Results")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...positions.map((p) {
            final candidates = List<Map<String, dynamic>>.from(p['candidates']);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...candidates.map((c) => Text("${c['name']}: ${c['votesPercent']}%")),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _publishResults,
            child: const Text("Publish Results"),
          ),
        ],
      ),
    );
  }
}
