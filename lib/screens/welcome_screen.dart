import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Using go_router for consistency

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Matching the Sky Blue background from your Login Screen
      backgroundColor: const Color(0xFF87CEEB),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon or Logo
              const Icon(
                Icons.how_to_vote,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 24),

              // App Title
              const Text(
                "E-VOTE SYSTEM",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3A57),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Secure, Fast, and Transparent",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1B3A57),
                ),
              ),
              const SizedBox(height: 48),

              // Start Button
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B3A57),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Changed to go_router navigation to match your other screens
                    context.go('/login');
                  },
                  child: const Text(
                    "Start Voting",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
