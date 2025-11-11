import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscurePassword = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF102222);
    final Color secondaryTextColor = isDark ? Colors.white.withOpacity(0.9) : const Color(0xFF666666);
    final Color borderColor = isDark ? const Color(0xFF326767) : Colors.grey[300]!;
    final Color placeholderColor = isDark ? const Color(0xFF92c9c9) : Colors.grey[400]!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _TopAppBar(
              onBack: () {
                // Handle back navigation
                Navigator.of(context).pop();
              },
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // Form Section
                    Column(
                      children: [
                        _FullNameField(
                          controller: _fullNameController,
                          borderColor: borderColor,
                          textColor: textColor,
                          placeholderColor: placeholderColor,
                          secondaryTextColor: secondaryTextColor,
                        ),
                        const SizedBox(height: 16),
                        _EmailField(
                          controller: _emailController,
                          borderColor: borderColor,
                          textColor: textColor,
                          placeholderColor: placeholderColor,
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
                          borderColor: borderColor,
                          textColor: textColor,
                          placeholderColor: placeholderColor,
                          secondaryTextColor: secondaryTextColor,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Footer Section
                    _FooterSection(
                      isDark: isDark,
                      borderColor: borderColor,
                      onSignUp: () {
                        // Handle sign up
                      },
                      onGoogleSignIn: () {
                        // Handle Google sign in
                      },
                      onAppleSignIn: () {
                        // Handle Apple sign in
                      },
                      onLogin: () {
                        // Navigate to login screen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  final VoidCallback onBack;

  const _TopAppBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF102222);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back,
              color: textColor.withOpacity(0.8),
              size: 24,
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Create Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
                letterSpacing: -0.015,
              ),
            ),
          ),

          // Spacer to balance the back button
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _FullNameField extends StatelessWidget {
  final TextEditingController controller;
  final Color borderColor;
  final Color textColor;
  final Color placeholderColor;
  final Color secondaryTextColor;

  const _FullNameField({
    required this.controller,
    required this.borderColor,
    required this.textColor,
    required this.placeholderColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your full name',
              hintStyle: TextStyle(color: placeholderColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  final Color borderColor;
  final Color textColor;
  final Color placeholderColor;
  final Color secondaryTextColor;

  const _EmailField({
    required this.controller,
    required this.borderColor,
    required this.textColor,
    required this.placeholderColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your email address',
              hintStyle: TextStyle(color: placeholderColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
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
  final Color borderColor;
  final Color textColor;
  final Color placeholderColor;
  final Color secondaryTextColor;

  const _PasswordField({
    required this.controller,
    required this.obscurePassword,
    required this.onToggleVisibility,
    required this.borderColor,
    required this.textColor,
    required this.placeholderColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: placeholderColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: placeholderColor,
                ),
                onPressed: onToggleVisibility,
              ),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterSection extends StatelessWidget {
  final bool isDark;
  final Color borderColor;
  final VoidCallback onSignUp;
  final VoidCallback onGoogleSignIn;
  final VoidCallback onAppleSignIn;
  final VoidCallback onLogin;

  const _FooterSection({
    required this.isDark,
    required this.borderColor,
    required this.onSignUp,
    required this.onGoogleSignIn,
    required this.onAppleSignIn,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign Up Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onSignUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0da5a5),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.015,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Social Sign-up Divider
        Row(
          children: [
            Expanded(
              child: Divider(color: borderColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or continue with',
                style: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: Divider(color: borderColor),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Social Login Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              onPressed: onGoogleSignIn,
              borderColor: borderColor,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBZB5iO5kphSVKpowhcVisuC86g2_lFMkG95x_0-I9n9YLcxEkEpp54V5OOTb9iMxD_VQQO93k78_JpUuShohCC-uRxHZq2rGMpkg2jgq5SaIisFskQB8uUuTa5xHe_otN3Qc23u31wk2U_jw12KH39P2uYCq998cpTfCMQnVt_OplOCR-KypVlhegTEN55TmbApCzdnAN7JINMOfPfih7-lNS7kssnuv25n7f-CVKMckKjvbSQVPLVIiyGJzMbD7f-42IOxx88WC4d',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 24),
            _SocialButton(
              onPressed: onAppleSignIn,
              borderColor: borderColor,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDO4masr2IybT9UC7VcgkURItwzh_nVdH4bV8c2uTeGgZ6Fat_ik_vzJHQu6RUk8rRSzoQMf4SbYpYS3WKMOKmXXxFhOtWTkou4DhmpR8QN0oYOEPZDla87sdeHwqikYmuAPu6dvm2-LaSzrANRzBN1_lyLwm8I9X2OhU0rsoCVtFlf-vhutXlgdyG2CmD4w2fkCWDajP3e6ggR31NvHgKytwM3zEECTxwZ5NeX76eqlrFkg1VCFi5tESvwu6OF33a5oY9SH-aRTlXY',
                width: 28,
                height: 28,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Terms and Login Links
        Column(
          children: [
            Text.rich(
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                ),
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: const TextStyle(
                      color: Color(0xFF0da5a5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      color: Color(0xFF0da5a5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                ),
                children: [
                  TextSpan(
                    text: 'Log In',
                    style: const TextStyle(
                      color: Color(0xFF0da5a5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color borderColor;
  final Widget child;

  const _SocialButton({
    required this.onPressed,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: child),
      ),
    );
  }
}