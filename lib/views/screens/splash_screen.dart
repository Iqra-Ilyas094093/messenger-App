import 'package:flutter/material.dart';
import 'package:messenger_app/views/authentication/phone_authentication.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
            ],
          ),
          image: const DecorationImage(
            image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAkmsFOyHq_RmPyetRXOyoDI4wVa0TSC_sCe-i1KpEJbq7tpdVJj073NtvGgUCEx8GRrUxgG3NI6OnJLw1T8SRqqOFSxWspEfuHr-9ZGNxRK_QyXHXfkZpqoLHSCM0oRYb-DfjP5jqpsOvaHdhltEJ7JeHynooKy4mTa8okfa6ECJypIvynLhBLj_Nv57FyyjD4qgrv88HYSdL7VTaMtjEdKZHFn_lWLyIUzrtUGaobFvHOebHfJVp9t1SgVLq3UoLLa8jgCtwVtIhw',
            ),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            // Logo/Icon Section
            Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.forum_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Title Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Connect Beautifully',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'A new way to experience messaging, designed for you.',
                      style: TextStyle(
                        color: Color(0xFFD1D5DB),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>PhoneAuthScreen()));
                    // Handle get started action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080),
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: const Color(0xFF008080).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.015,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Login Text
            GestureDetector(
              onTap: () {
                // Handle login action
              },
              child: const Text(
                'Already have an account? Log In',
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}