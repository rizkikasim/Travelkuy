import 'package:flutter/material.dart';
import '../../atoms/primary_button.dart';
import '../../molecules/auth/dot_indicator.dart';
import '../../molecules/auth/onboarding_content.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _data = [
    {
      "title": "Travel with",
      "high": "Easy Booking",
      "desc": "Experience seamless bus bookings with premium amenities and real-time tracking at your fingertips.",
      "img": "assets/images/onboarding/ob4.png"
    },
    {
      "title": "Explore the",
      "high": "New World",
      "desc": "Find the best destinations and exclusive deals for your next adventure with TravelKuy.",
      "img": "assets/images/onboarding/ob5.png"
    },
    {
      "title": "Travel with",
      "high": "Comfort",
      "desc": "Your safety and comfort are our priority. Enjoy premium services throughout your journey.",
      "img": "assets/images/onboarding/ob6.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              "Skip", 
              style: TextStyle(
                color: Color(0xFF0D9488), 
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // 1. Area Gambar (Setengah layar atas)
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (v) => setState(() => _currentIndex = v),
                itemCount: _data.length,
                itemBuilder: (context, i) => OnboardingContent(
                  title: _data[i]['title']!,
                  highlightedText: _data[i]['high']!,
                  description: _data[i]['desc']!,
                  imagePath: _data[i]['img']!,
                ),
              ),
            ),
            
            // 2. Indikator Titik (Dot Indicator) - Posisi sesuai gambar (di atas teks)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _data.length, 
                (index) => DotIndicator(isActive: index == _currentIndex),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // 3. Tombol Aksi Utama (Get Started / Next Step)
            PrimaryButton(
              label: _currentIndex == 2 ? "Get Started" : "Next Step →",
              onPressed: () {
                if (_currentIndex < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400), 
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
            
            const SizedBox(height: 50), // Margin bawah agar tidak terlalu mepet bar navigasi HP
          ],
        ),
      ),
    );
  }
}