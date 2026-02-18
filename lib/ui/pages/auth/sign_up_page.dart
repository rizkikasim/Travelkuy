import 'package:flutter/material.dart';
import '../../atoms/primary_button.dart';
import '../../atoms/custom_text_field.dart';
import '../../molecules/social_login_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 8),
              const Text(
                "Start your journey with us today",
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(height: 32),

              // Form Fields
              const Text("FULL NAME", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              const CustomTextField(hintText: "John Doe", prefixIcon: Icons.person_outline),
              
              const SizedBox(height: 20),
              const Text("EMAIL ADDRESS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              const CustomTextField(hintText: "name@example.com", prefixIcon: Icons.email_outlined),
              
              const SizedBox(height: 20),
              const Text("PASSWORD", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              const CustomTextField(
                hintText: "••••••••", 
                prefixIcon: Icons.lock_outline, 
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.blueGrey),
              ),

              const SizedBox(height: 32),
              PrimaryButton(label: "Sign Up", onPressed: () {}),

              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("OR SIGN UP WITH", style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                  ),
                  Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                ],
              ),
              const SizedBox(height: 24),

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
                    const Text("Already have an account? ", style: TextStyle(color: Colors.blueGrey)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text("Log In", style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}