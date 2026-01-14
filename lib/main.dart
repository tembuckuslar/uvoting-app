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
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
    scaffoldBackgroundColor: const Color(0xFF87CEEB), // ✅ background for all screens

    appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF87CEEB), // dark blue
    titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),

    inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Color(0xFF6C7A89)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF1B3A57),
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    textStyle: const TextStyle(fontSize: 16, color: Colors.white),
    ),
    ),
    ),

    );
  }
}

