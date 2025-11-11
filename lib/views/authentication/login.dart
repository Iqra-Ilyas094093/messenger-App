import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF0a1014);
    final Color? secondaryTextColor = isDark ? Colors.grey[400]! : Colors.grey[600];
    final Color cardColor = isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFf0f0f0);
    final Color borderColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 400,
              child: Column(
                children: [
                  // Logo Section
                  const Column(
                    children: [
                      _LogoIcon(),
                      SizedBox(height: 16),
                      _TitleSection(),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Form Section
                  Column(
                    children: [
                      _EmailField(
                        controller: _emailController,
                        cardColor: cardColor,
                        textColor: textColor,
                        secondaryTextColor: secondaryTextColor,
                      ),
                      const SizedBox(height: 16),
                      _PasswordField(
                        controller: _passwordController,
                        obscurePassword: _obscurePassword,
                        onToggleVisibility: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        cardColor: cardColor,
                        textColor: textColor,
                        secondaryTextColor: secondaryTextColor,
                      ),
                      const SizedBox(height: 24),
                      _SignInButton(
                        onPressed: () {
                          // Handle sign in
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Divider Section
                  const _OrDivider(),

                  const SizedBox(height: 24),

                  // Social Login Section
                  const _SocialLoginButtons(),

                  const SizedBox(height: 24),

                  // Sign Up Link
                  _SignUpLink(
                    textColor: secondaryTextColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoIcon extends StatelessWidget {
  const _LogoIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF14b8a6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.chat,
        size: 32,
        color: Color(0xFF14b8a6),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF0a1014);
    final Color? secondaryTextColor = isDark ? Colors.grey[400]! : Colors.grey[600];

    return Column(
      children: [
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome back, you\'ve been missed!',
          style: TextStyle(
            fontSize: 16,
            color: secondaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  final Color cardColor;
  final Color textColor;
  final Color? secondaryTextColor;

  const _EmailField({
    required this.controller,
    required this.cardColor,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email or Phone Number',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: secondaryTextColor),
              prefixIcon: Icon(Icons.person, color: secondaryTextColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(color: textColor),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;
  final Color cardColor;
  final Color textColor;
  final Color? secondaryTextColor;

  const _PasswordField({
    required this.controller,
    required this.obscurePassword,
    required this.onToggleVisibility,
    required this.cardColor,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: secondaryTextColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle forgot password
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF14b8a6),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: secondaryTextColor),
              prefixIcon: Icon(Icons.lock, color: secondaryTextColor),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: secondaryTextColor,
                ),
                onPressed: onToggleVisibility,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(color: textColor),
          ),
        ),
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF14b8a6),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color dividerColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;
    final Color textColor = isDark ? Colors.grey[400]! : Colors.grey[500]!;

    return Row(
      children: [
        Expanded(
          child: Divider(color: dividerColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or continue with',
            style: TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: dividerColor),
        ),
      ],
    );
  }
}

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color borderColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;
    final Color buttonColor = isDark ? Colors.white.withOpacity(0.05) : Colors.white;
    final Color textColor = isDark ? Colors.grey[300]! : Colors.grey[700]!;

    return const Row(
      children: [
        Expanded(
          child: _SocialButton(
            icon: Icons.g_mobiledata,
            text: 'Google',
            isGoogle: true,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _SocialButton(
            icon: Icons.apple,
            text: 'Apple',
            isGoogle: false,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isGoogle;

  const _SocialButton({
    required this.icon,
    required this.text,
    required this.isGoogle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color borderColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;
    final Color buttonColor = isDark ? Colors.white.withOpacity(0.05) : Colors.white;
    final Color textColor = isDark ? Colors.grey[300]! : Colors.grey[700]!;
    final Color iconColor = isGoogle
        ? const Color(0xFF4285F4)
        : (isDark ? Colors.white : Colors.black);

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpLink extends StatelessWidget {
  final Color? textColor;

  const _SignUpLink({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: textColor,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Handle sign up navigation
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: const Color(0xFF14b8a6),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}