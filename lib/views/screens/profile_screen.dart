import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final Widget? trailing;
  final bool hasDivider;
  final VoidCallback? onTap;

  const SettingsItem({
    required this.title,
    this.subtitle,
    required this.icon,
    this.iconColor = const Color(0xFF008080),
    this.trailing,
    this.hasDivider = true,
    this.onTap,
  });
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _readReceiptsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF008080);
    final mutedTextColor = const Color(0xFF7b9a9a);
    final  backgroundColor=isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8);

    final accountItems = [
      SettingsItem(
        title: 'Email Address',
        subtitle: 'aria.m@example.com',
        icon: Icons.mail_outlined,
        onTap: () {},
      ),
      SettingsItem(
        title: 'Phone Number',
        subtitle: '+1 123-456-7890',
        icon: Icons.phone_iphone_outlined,
        onTap: () {},
      ),
      SettingsItem(
        title: 'Change Password',
        icon: Icons.lock_outlined,
        hasDivider: false,
        onTap: () {},
      ),
    ];

    final privacyItems = [
      SettingsItem(
        title: 'Read Receipts',
        icon: Icons.visibility_off_outlined,
        trailing: Switch(
          value: _readReceiptsEnabled,
          onChanged: (value) {
            setState(() {
              _readReceiptsEnabled = value;
            });
          },
          activeColor: primaryColor,
          activeTrackColor: primaryColor.withOpacity(0.5),
        ),
      ),
      SettingsItem(
        title: 'Blocked Contacts',
        subtitle: '3',
        icon: Icons.block_outlined,
        hasDivider: false,
        onTap: () {},
      ),
    ];

    final preferenceItems = [
      SettingsItem(
        title: 'Notifications',
        icon: Icons.notifications_outlined,
        onTap: () {},
      ),
      SettingsItem(
        title: 'Appearance',
        icon: Icons.palette_outlined,
        hasDivider: false,
        onTap: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.015,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          
              // Profile Section
              Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        // Avatar
                        Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuC4cNn1OVIj7NHInOKMYnVVnSace-s068MuASTILEI6aDcYbKPz7RnBrcNJXNG-jLQDgBNLHL4BPKXjjCPIqFry4GhLW_QpF_tZ0cggbScE2gGKs_2L5mJluYV2-J1_8nrbyre-39GLtSwXq0j9PJKM0pBchkKTiHeoSHOnX6M7ZrJEddCN5vVUN2PT0xu-U8S66CWRm4sU5EOa9ARu2wX_KkqkBipExL1Mg9PESOPXpq15iVYV2b5rcnT9B6lY42kFQR7q2-h0OTs0',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Name and Username
                        Column(
                          children: [
                            Text(
                              'Aria Montgomery',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.015,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '@aria.m',
                              style: TextStyle(
                                color: mutedTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Edit Profile Button
                    SizedBox(
                      width: 240,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor.withOpacity(0.2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.015,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 32),
              // Account Section
              _buildSettingsSection(
                title: 'ACCOUNT',
                items: accountItems,
                mutedTextColor: mutedTextColor,
                primaryColor: primaryColor,
              ),
          
              const SizedBox(height: 32),
          
              // Privacy & Security Section
              _buildSettingsSection(
                title: 'PRIVACY & SECURITY',
                items: privacyItems,
                mutedTextColor: mutedTextColor,
                primaryColor: primaryColor,
              ),
          
              const SizedBox(height: 32),
          
              // Preferences Section
              _buildSettingsSection(
                title: 'PREFERENCES',
                items: preferenceItems,
                mutedTextColor: mutedTextColor,
                primaryColor: primaryColor,
              ),
          
              const SizedBox(height: 32),
          
              // Log Out Button
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.1),
                      foregroundColor: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<SettingsItem> items,
    required Color mutedTextColor,
    required Color primaryColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              title,
              style: TextStyle(
                color: mutedTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: items.map((item) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: item.onTap,
                    borderRadius: items.indexOf(item) == 0
                        ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                        : items.indexOf(item) == items.length - 1
                        ? const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )
                        : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 64,
                      child: Row(
                        children: [
                          // Icon
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              color: primaryColor,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Title and Subtitle
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (item.subtitle != null) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    item.subtitle!,
                                    style: TextStyle(
                                      color: mutedTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          // Trailing Widget
                          if (item.trailing != null)
                            item.trailing!
                          else
                            Icon(
                              Icons.arrow_forward_ios,
                              color: mutedTextColor,
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161022),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              color: Color(0xFF7b9a9a),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF7b9a9a),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform logout logic here
                Navigator.of(context).pop();
                // Navigate to login screen or perform logout
              },
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}