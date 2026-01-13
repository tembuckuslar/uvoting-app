import 'package:flutter/material.dart';

class ElectionControlScreen extends StatefulWidget {
  final String electionId;
  const ElectionControlScreen({super.key, required this.electionId});

  @override
  State<ElectionControlScreen> createState() => _ElectionControlScreenState();
}

class _ElectionControlScreenState extends State<ElectionControlScreen> {
  bool starting = false;
  bool ending = false;
  bool publishing = false;

  /// ✅ Start the election
  Future<void> adminStart(String electionId) async {
    setState(() => starting = true);
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate backend call
      setState(() => starting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Election started successfully!")),
      );
    } catch (e) {
      setState(() => starting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to start election: $e")),
      );
    }
  }

  /// ✅ End the election
  Future<void> adminEnd(String electionId) async {
    setState(() => ending = true);
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate backend call
      setState(() => ending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Election ended successfully!")),
      );
    } catch (e) {
      setState(() => ending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to end election: $e")),
      );
    }
  }

  /// ✅ Publish the results
  Future<void> adminPublish(String electionId) async {
    setState(() => publishing = true);
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate backend call
      setState(() => publishing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Results published successfully!")),
      );
    } catch (e) {
      setState(() => publishing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to publish results: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Election Control")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: starting ? null : () => adminStart(widget.electionId),
              child: starting
                  ? const CircularProgressIndicator()
                  : const Text("Start Election"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: ending ? null : () => adminEnd(widget.electionId),
              child: ending
                  ? const CircularProgressIndicator()
                  : const Text("End Election"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
              publishing ? null : () => adminPublish(widget.electionId),
              child: publishing
                  ? const CircularProgressIndicator()
                  : const Text("Publish Results"),
            ),
          ],
        ),
      ),
    );
  }
}

