import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/group_chat_screen.dart';

class Group {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final int unreadCount;
  final bool isYourMessage;

  const Group({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.unreadCount = 0,
    this.isYourMessage = false,
  });
}

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Group> groups = [
    Group(
      name: 'Design Team',
      lastMessage: 'Alex: See you then!',
      time: '10:42 PM',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB4M5g4s47sm7EnEHN-k9Dga-GFEhxvOb7RkS8ZKvfjG7eaAzZjOYzjR9IeY8_h2incRK6PZtROtLn0R5_MC-FpiP21Ivj1AHyEagPUoDhpFImEOnhbNgEBQ4aa2JoTzo3DVEZw_K3rIROlmsyO2K_rF7STTGYnOn1kmGKsvwIQi8JA6rbcNU1PKUq8rqGwh3RJehFMSOJ817Doe8vAEDO53KDTnh_8ZyBPbPR3EFRAti6te94cOKyvkdiIeYm2-MVbaMYMHWwjxw1B',
    ),
    Group(
      name: 'Weekend Gamers',
      lastMessage: 'You: Great game last night!',
      time: 'Yesterday',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAqCBo3lnbf0Cd8N3coY1A-JrA_hqfhBEEwLQmUzgfJNpSkg-hkFf87QeBd9Wai3J5_uCW7fSMl3bFm_qPGFjLDa6cCNxh3cv7ZweXKp-JVpF1hlWbSyk3WsLLtguqdDzvirBc0X-_B5LyXJ_WRcQJ5hYSuAfuL9J8Q8y531rIYfqTiENHCBT5HkTn0WfflesSIc6-wVtsPmqMSUg2LdqlHkLlPAcUyHf4-9sHgEh3wJr0tIxO43gani2yMvOl843z9r-h_xSPhuvA9',
      unreadCount: 2,
      isYourMessage: true,
    ),
    Group(
      name: 'Project Phoenix',
      lastMessage: 'Maria: The final report is attached.',
      time: 'Yesterday',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB4QWFv_W-WEiE7PH-jRliexmQaoDgvrOIHfNQ8ADrddk1j_NXSiQFZFy4HvsCCR1YFlUPb122MBItnfhogY7Qbg0C4tNxEvW58g5jQC9ULNgXUC475V1N7ChvKzSBGPAiJ0bULPOJdNO_GY2IbwhbAy_ziGLMrFMEfQN_Du1wkmK6y4JwQAiaLCLZc4IAUbA70nXQvmOdibJkIHILBncOFd_uo38fKgKug5msGHIZ0ybtjuLWImmSQKiQKi4Hr5dglbl5dyGtPEEuv',
    ),
    Group(
      name: 'Hiking Club',
      lastMessage: 'Just a reminder about Saturday\'s trip!',
      time: 'Tue',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCl2LgDgVK5oxfuVJTnMs-R30mNsfX3qSIrqahfrsFLO_bDROC9JwMFcfGkNrcYrH7OhlY_iStkx85fMs99kROmIkApuTZPh0cI61YfXs97ZRguSD3X9aho2nbLaWUeXgX_H0Bg1sgSkCgD-gd59X1pgeS9DUjD0LLR1FSKw9rf-Aqqkc4nrGFxc8AYBV8OxujwblznIXfZE5BoyWqzvNlDpuQ-Wxvm4FDuHNoO8zznzOMmsCUWZpddMkxmkEukywpK43wpyTcGG4-C',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF04aeae);
    final mutedTextColor = isDark ? const Color(0xFF8ecccc) : const Color(0xFF64748B);
    final cardColor = isDark ? const Color(0xFF214a4a) : const Color(0xFFE2E8F0);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
      body: Column(
        children: [
          // Top App Bar
          Container(
            decoration: BoxDecoration(
              color:isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
            ),
            padding: const EdgeInsets.all(16).copyWith(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Groups',
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.015,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.search,
                      color: mutedTextColor,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search groups...',
                        hintStyle: TextStyle(
                          color: mutedTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Groups List
          Expanded(
            child: groups.isEmpty
                ? _buildEmptyState(isDark, mutedTextColor)
                : ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return _buildGroupItem(
                  group,
                  isDark,
                  primaryColor,
                  mutedTextColor,
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNewGroup();
        },
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildGroupItem(
      Group group,
      bool isDark,
      Color primaryColor,
      Color mutedTextColor,
      ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _openGroupChat(group);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 72,
          child: Row(
            children: [
              // Avatar
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(group.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Group Info
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name,
                      style: TextStyle(
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      group.lastMessage,
                      style: TextStyle(
                        color: mutedTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Time and Unread Count
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    group.time,
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  if (group.unreadCount > 0) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          group.unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark, Color mutedTextColor) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group_outlined,
              color: isDark ? const Color(0xFF475569) : const Color(0xFF94A3B8),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'No Groups Yet',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF0F172A),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a new group to start chatting with friends and family.',
              style: TextStyle(
                color: mutedTextColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _createNewGroup() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF0f2323)
          : const Color(0xFFf5f8f8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create New Group',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Add your group creation form here
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  void _openGroupChat(Group group) {
    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>GroupChatScreen()));
    // Navigate to group chat screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening ${group.name}'),
        backgroundColor: const Color(0xFF04aeae),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}