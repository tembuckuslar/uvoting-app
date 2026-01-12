import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../api.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> _login() async {
    final res = await login(emailCtrl.text, passCtrl.text);
    if (res['user']?['role'] == 'ADMIN') {
      if (!mounted) return;
      context.go('/admin');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not an admin account')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Login")),
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
