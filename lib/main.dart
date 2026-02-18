import 'package:flutter/material.dart';
import 'ui/pages/auth/onboarding_page.dart';

void main() {
  runApp(const TravelKuyApp());
}

class TravelKuyApp extends StatelessWidget {
  const TravelKuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelKuy',
      debugShowCheckedModeBanner: false,
      // Mengatur tema global aplikasi agar konsisten dengan desain
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins', // Pastikan sudah menambahkan font di pubspec.yaml
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D9488),
          primary: const Color(0xFF0D9488),
        ),
      ),
      // Menentukan halaman awal
      home: const OnboardingPage(),
    );
  }
}