import 'package:flutter/material.dart';

class FinalResultsScreen extends StatefulWidget {
  final String electionId;
  const FinalResultsScreen({super.key, required this.electionId});

  @override
  State<FinalResultsScreen> createState() => _FinalResultsScreenState();
}

class _FinalResultsScreenState extends State<FinalResultsScreen> {
  bool publishing = false;
  bool published = false;

  /// ✅ Define the adminPublish method
  Future<void> adminPublish(String electionId) async {
    setState(() => publishing = true);

    try {
      // Simulate backend call with delay
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with real API call:
      // final response = await http.post(
      //   Uri.parse("https://yourapi.com/elections/$electionId/publish"),
      // );

      setState(() {
        publishing = false;
        published = true;
      });

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
      appBar: AppBar(title: const Text("Final Results")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (publishing)
              const CircularProgressIndicator()
            else if (published)
              const Text("Results have been published!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            else
              ElevatedButton(
                onPressed: () => adminPublish(widget.electionId),
                child: const Text("Publish Results"),
              ),
          ],
        ),
      ),
    );
  }
}
