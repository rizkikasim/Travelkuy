import 'package:flutter/material.dart';
import '../../atoms/primary_button.dart';
import '../../atoms/form/custom_text_field.dart';
import '../../molecules/auth/social_login_button.dart';
import 'sign_up_page.dart';
import '../home_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Inisialisasi Controller untuk mengambil data input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    
    if (email == "nova@travelkuy.com" && password == "password123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email atau Password salah!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Logo Section
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.directions_bus_filled,
                    size: 50,
                    color: Color(0xFF0D9488),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "TravelKuy",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Ready for your next journey?",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Form Section
              const Text(
                "EMAIL ADDRESS",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _emailController, // Hubungkan controller
                hintText: "name@example.com",
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 24),
              const Text(
                "PASSWORD",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _passwordController, // Hubungkan controller
                hintText: "••••••••",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.blueGrey),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              PrimaryButton(
                label: "Log In",
                onPressed: _handleLogin, // Panggil fungsi login
              ),

              const SizedBox(height: 32),
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                ],
              ),
              const SizedBox(height: 32),

              SocialLoginButton(
                label: "Google",
                iconPath: "assets/images/google_logo.png",
                onTap: () {},
              ),

              const SizedBox(height: 32),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF0D9488),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}