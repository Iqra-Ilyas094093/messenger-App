import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/navigation.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int _resendTimer = 59;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _setupFocusListeners();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          if (_resendTimer > 0) {
            _resendTimer--;
            _startResendTimer();
          } else {
            _canResend = true;
          }
        });
      }
    });
  }

  void _setupFocusListeners() {
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          _controllers[i].selection = TextSelection(
            baseOffset: 0,
            extentOffset: _controllers[i].text.length,
          );
        }
      });
    }
  }

  void _onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _onVerifyPressed() {
    // Handle verification logic
    String code = _controllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      // Proceed with verification
    }
  }

  void _onResendCode() {
    if (_canResend) {
      setState(() {
        _resendTimer = 59;
        _canResend = false;
        // Clear all fields
        for (var controller in _controllers) {
          controller.clear();
        }
        _focusNodes[0].requestFocus();
      });
      _startResendTimer();
      // Trigger resend logic
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF0f2323);
    final Color secondaryTextColor =
    isDark ? const Color(0xFFd4d4d8) : const Color(0xFF71717a);
    final Color borderColor = isDark ? const Color(0xFF3f3f46) : const Color(0xFFe4e4e7);
    final Color placeholderColor = isDark ? const Color(0xFFa1a1aa) : const Color(0xFFa1a1aa);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _TopAppBar(
              onBack: () {
                Navigator.of(context).pop();
              },
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      // Icon Section
                      _VerificationIcon(),

                      const SizedBox(height: 32),

                      // Text Section
                      _TextSection(
                        textColor: textColor,
                        secondaryTextColor: secondaryTextColor,
                      ),

                      const SizedBox(height: 32),

                      // OTP Input Fields
                      _OtpInputFields(
                        controllers: _controllers,
                        focusNodes: _focusNodes,
                        onCodeChanged: _onCodeChanged,
                        borderColor: borderColor,
                        textColor: textColor,
                        placeholderColor: placeholderColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Section
            _BottomSection(
              onVerifyPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Navigation()));
              },
              onResendCode: _onResendCode,
              resendTimer: _resendTimer,
              canResend: _canResend,
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
    final Color textColor = isDark ? Colors.white : const Color(0xFF0f2323);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
              size: 24,
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Verification',
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

class _VerificationIcon extends StatelessWidget {
  const _VerificationIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF04aeae).withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.security,
        size: 40,
        color: Color(0xFF04aeae),
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  final Color textColor;
  final Color secondaryTextColor;

  const _TextSection({
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Check Your Email',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textColor,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'We sent a 6-digit verification code to your email address.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: secondaryTextColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _OtpInputFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(String, int) onCodeChanged;
  final Color borderColor;
  final Color textColor;
  final Color placeholderColor;

  const _OtpInputFields({
    required this.controllers,
    required this.focusNodes,
    required this.onCodeChanged,
    required this.borderColor,
    required this.textColor,
    required this.placeholderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: 48,
              height: 64,
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF04aeae)),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) {
                  onCodeChanged(value, index);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final VoidCallback onVerifyPressed;
  final VoidCallback onResendCode;
  final int resendTimer;
  final bool canResend;

  const _BottomSection({
    required this.onVerifyPressed,
    required this.onResendCode,
    required this.resendTimer,
    required this.canResend,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color secondaryTextColor =
    isDark ? const Color(0xFFa1a1aa) : const Color(0xFF71717a);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          // Verify Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: onVerifyPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF04aeae),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: const Color(0xFF04aeae).withOpacity(0.3),
              ),
              child: const Text(
                'Verify & Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Resend Code Text
          Text.rich(
            TextSpan(
              text: "Didn't receive code? ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: secondaryTextColor,
              ),
              children: [
                if (!canResend)
                  TextSpan(
                    text: 'Resend in 0:${resendTimer.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      color: Color(0xFF04aeae),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                else
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: onResendCode,
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                          color: Color(0xFF04aeae),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF04aeae),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}