import 'package:flutter/material.dart';
import '../api.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void _login() async {
    final success = await login(emailCtrl.text, passCtrl.text);
    if (success) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const UserDashboardScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
          TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: _login, child: const Text("Login")),
        ]),
      ),
    );
  }
}
