import 'package:flutter/material.dart';

class VerificationFailedScreen extends StatelessWidget {
  const VerificationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verification Failed")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 24),
            const Text(
              "Face Verification Failed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "We couldn't verify your identity. Please try again or contact support.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Go back to retry
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Try Again"),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // TODO: Navigate to support or help screen
              },
              child: const Text("Contact Support"),
            ),
          ],
        ),
      ),
    );
  }
}
