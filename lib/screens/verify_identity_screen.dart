import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'face_scan_screen.dart';
import 'verification_failed_screen.dart';

class VerifyIdentityScreen extends StatelessWidget {
  final String candidate;
  const VerifyIdentityScreen({super.key, required this.candidate});

  Future<void> _verify(BuildContext context) async {
    final auth = LocalAuthentication();
    final ok = await auth.authenticate(
      localizedReason: "Verify your identity to vote",
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );

    if (!context.mounted) return;

    if (ok) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FaceScanScreen(candidate: candidate),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const VerificationFailedScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Identity")),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.fingerprint),
          label: const Text("Start Verification"),
          onPressed: () => _verify(context),
        ),
      ),
    );
  }
}
