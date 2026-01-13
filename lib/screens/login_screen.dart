import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Temporary login function (replace with real backend later)
Future<String> login(String email, String password) async {
  await Future.delayed(const Duration(milliseconds: 500));
  if (email == "voter@example.com" && password == "pass") {
    return "VOTER";
  }
  return "INVALID";
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _VoterLoginScreenState();
}

class _VoterLoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> _login() async {
    final res = await login(emailCtrl.text.trim(), passCtrl.text.trim());

    if (!mounted) return;

    if (res == "VOTER") {
      context.go('/voter/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Evote Login")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome Voter", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 30),
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () => context.go('/voter/signup'),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}


