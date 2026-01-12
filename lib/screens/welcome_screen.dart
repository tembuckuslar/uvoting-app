import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Start Voting"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
        ),
      ),
    );
  }
}
