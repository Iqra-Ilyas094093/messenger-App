import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger_app/views/screens/audio_call_screen.dart';
import 'package:messenger_app/views/screens/chatScreen.dart';
import 'package:messenger_app/views/screens/video_call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Details',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13ECDA),
          background: const Color(0xFFF6F8F8),
        ),
        fontFamily: GoogleFonts.splineSans().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13ECDA),
          brightness: Brightness.dark,
          background: const Color(0xFF102220),
        ),
        fontFamily: GoogleFonts.splineSans().fontFamily,
      ),
      home: const ContactDetailsScreen(),
    );
  }
}

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({super.key});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  bool _isMuted = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF13ECDA);
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final secondaryTextColor = isDark ? primaryColor : const Color(0xFF64748B);
    final cardColor = isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.5);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF102220) : const Color(0xFFF6F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top App Bar
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: const CircleBorder(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDPV7MxTfN_JcYCjeGpXzU3_vpqE5qfGRD2M29stmMaYrvfEp3eNvXfJTQvpFrpzbUtXcc3ifbrjNqCuD83cJrAMJeLpkdoAvdJ3FFc_Zn990_kEgU2lCVfDu0ZTE2VRPvae8OYYvth3HNAuRcDnreg9jWac0beMYjlszqZ3HKaWfzh6wAxAuaVJTdhfn_lF33vdKmE0Sh86RjoB7OmNaaXIr-WnjAhYcFObkerigDGrMwFEQ0SYVDAYFhvvbfohqJYqVFMG-5_wnv0',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Alex Martinez',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Actions Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: Icons.call,
                      label: 'Call',
                      color: primaryColor,
                      ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AudioCallScreen()));
                      }
                    ),
                    _buildActionButton(
                      icon: Icons.videocam,
                      label: 'Video',
                      color: primaryColor,
                      ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>VideoCallScreen()));
                      }
                    ),
                    _buildActionButton(
                      icon: Icons.chat_bubble_outline,
                      label: 'Message',
                      color: primaryColor,
                      ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen()));
                      }
                    ),
                  ],
                ),
              ),

              // Contact Information Section
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildContactItem(
                        icon: Icons.phone,
                        title: '+1 (555) 123-4567',
                        subtitle: 'Mobile',
                        primaryColor: primaryColor,
                      ),
                      _buildContactItem(
                        icon: Icons.mail,
                        title: 'alex.martinez@email.com',
                        subtitle: 'Email',
                        primaryColor: primaryColor,
                      ),
                      _buildContactItem(
                        icon: Icons.info_outline,
                        title: 'Living life one day at a time.',
                        subtitle: 'Bio',
                        primaryColor: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),

              // Settings & Options Section
              Padding(
                padding: const EdgeInsets.all(16.0).copyWith(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildSettingItem(
                        icon: Icons.notifications_off,
                        title: 'Mute Notifications',
                        primaryColor: primaryColor,
                        trailing: Switch(
                          value: _isMuted,
                          onChanged: (value) {
                            setState(() {
                              _isMuted = value;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                      _buildSettingItem(
                        icon: Icons.block,
                        title: 'Block Contact',
                        primaryColor: primaryColor,
                        titleColor: Colors.red,
                        iconColor: Colors.red,
                      ),
                      _buildSettingItem(
                        icon: Icons.share,
                        title: 'Share Contact',
                        primaryColor: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color primaryColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Color primaryColor,
    Color? titleColor,
    Color? iconColor,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor ?? primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}