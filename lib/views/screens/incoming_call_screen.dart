import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/audio_call_screen.dart';
import 'package:messenger_app/views/screens/call_decline_screen.dart';


class IncomingCallScreen extends StatefulWidget {
  const IncomingCallScreen({super.key});

  @override
  State<IncomingCallScreen> createState() => _IncomingCallScreenState();
}

class _IncomingCallScreenState extends State<IncomingCallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF0f2323) : const Color(0xFFf5f8f8);
    final primaryColor = const Color(0xFF04afaf);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status Bar
              _buildStatusBar(),
              const Spacer(),
              // Caller Info Section
              _buildCallerInfo(primaryColor),
              const Spacer(),
              // Actions Section
              _buildActionsSection(primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Time
        Text(
          "9:41",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Status Icons
        Row(
          children: [
            Icon(
              Icons.signal_cellular_alt,
              color: Colors.white.withOpacity(0.8),
              size: 16,
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.wifi,
              color: Colors.white.withOpacity(0.8),
              size: 16,
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.battery_full,
              color: Colors.white.withOpacity(0.8),
              size: 16,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCallerInfo(Color primaryColor) {
    return Column(
      children: [
        // Animated Profile Picture
        Stack(
          alignment: Alignment.center,
          children: [
            // Pulsing border
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 144,
                  height: 144,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColor.withOpacity(0.3),
                      width: 4,
                    ),
                  ),
                );
              },
            ),
            // Profile Picture
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuBq5F4GUZ_AjbXp56tSIWR74ESnKeQvvAn8HH1SXCeZAC_D_JgvUgvBHp44NM_EV_YmcRIRtKEXP8vJzefF9vWRqiLhGlL0k5C5gcEjWZ76UpU04ThlbNrggr7EYFX6uTIeFrNmJckSGiuzj6aFV39t5jcDkCRNJRRUaf4ARP8NGJEVxGswkfjINCt6L9HrScEio1RxkJEUWItbnKxid-zZjAtegv6Ap23F_BVKZgeahCpMFcBtS6SOBAhxnPe4dfuwvrGFYmq7cW0Q",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Caller Name
        Text(
          "Alex",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'Spline Sans',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        // Call Type
        Text(
          "Incoming Video Call",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Spline Sans',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionsSection(Color primaryColor) {
    return Column(
      children: [
        // Secondary Actions
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSecondaryAction(
                icon: Icons.sms,
                label: "Message",
                onTap: () {
                  // Message functionality
                },
              ),
              _buildSecondaryAction(
                icon: Icons.alarm,
                label: "Remind Me",
                onTap: () {
                  // Remind me functionality
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        // Main Actions
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMainAction(
                icon: Icons.call_end,
                label: "Decline",
                backgroundColor: Colors.red,
                onTap: () {
                  _declineCall();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CallDeclinedScreen()));
                },
              ),
              _buildMainAction(
                icon: Icons.videocam,
                label: "Accept",
                backgroundColor: primaryColor,
                onTap: () {
                  _acceptCall();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>AudioCallScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainAction({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _declineCall() {
    // Decline call logic
    Navigator.of(context).pop();
  }

  void _acceptCall() {
    // Accept call logic - navigate to video call screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCallScreen()));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Call Accepted"),
        content: const Text("Connecting to video call..."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}