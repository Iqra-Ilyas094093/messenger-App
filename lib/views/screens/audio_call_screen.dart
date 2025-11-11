import 'package:flutter/material.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({super.key});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  Duration callDuration = const Duration(minutes: 2, seconds: 15);
  bool isMuted = true;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF0f2323) : const Color(0xFFf5f8f8);
    final primaryColor = const Color(0xFF04afaf);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor,
          ),

          // Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white70,
                      size: 32,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: const CircleBorder(),
                    ),
                  ),
                  // Add person button
                  IconButton(
                    onPressed: () {
                      // Add person functionality
                    },
                    icon: const Icon(
                      Icons.person_add,
                      color: Colors.white70,
                      size: 32,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 80,
                bottom: 160,
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Picture
                  Container(
                    width: 144,
                    height: 144,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuD7KSPzbM9mPyzADODGoIA9y7Qjl3cVSgJK2adthk4D01pen5uzATPZXpmCGhgwmr9Z0tKqhbm9JAAKstbxY_XiKbesYYx1p_ZVXH-zJdT0amMzx_U3oif6Ryt8IVSP5RDuViG8KM4BbKBfYV803tlOiC3fEOmUfY4YuizKg2F6KxUMf1RbnfGRwws4ZmON1H9iwiylJ7ZycYxHdo6wV3HBGmIgIO9ZwLt-P_C2b6-odS79Fd0zokPgeZCU_K4xHx0ocC5LGFVBWxZN",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Contact Name
                  Text(
                    "Jordan Smith",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Spline Sans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // Call Duration
                  Text(
                    _formatDuration(callDuration),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Spline Sans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Toolbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    backgroundColor.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                    backgroundBlendMode: BlendMode.overlay,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Speaker Button
                      _buildToolbarButton(
                        icon: Icons.volume_up,
                        backgroundColor: primaryColor.withOpacity(0.2),
                        onPressed: () {
                          // Toggle speaker
                        },
                      ),
                      const SizedBox(width: 24),
                      // Mic Button
                      _buildToolbarButton(
                        icon: isMuted ? Icons.mic_off : Icons.mic,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        onPressed: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                        },
                      ),
                      const SizedBox(width: 24),
                      // End Call Button
                      _buildEndCallButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarButton({
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
      ),
    );
  }

  Widget _buildEndCallButton() {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        color: Color(0xFFFF3B30),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          // End call functionality
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.call_end,
          color: Colors.white,
          size: 32,
        ),
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}