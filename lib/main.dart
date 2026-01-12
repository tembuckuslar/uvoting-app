import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  runApp(const EvoteApp());
}

class EvoteApp extends StatelessWidget {
  const EvoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Evote',
      theme: ThemeData(primarySwatch: Colors.green),
      routerConfig: router,
    );
  }
}

