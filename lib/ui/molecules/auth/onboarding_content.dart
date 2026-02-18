import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String highlightedText;
  final String description;
  final String imagePath;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.highlightedText,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Container dengan background soft teal
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2F1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Image.asset(imagePath, height: 250), // Ganti dengan assetmu
          ),
        ),
        const SizedBox(height: 40),
        // Text Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            Text(
              highlightedText,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0D9488)),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
            ),
          ],
        ),
      ],
    );
  }
}