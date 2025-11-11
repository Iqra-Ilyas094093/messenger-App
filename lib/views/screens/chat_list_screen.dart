import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/chatScreen.dart';
class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final int unreadCount;
  final bool isOnline;
  final bool isGroup;
  final bool isMuted;
  final String? messageType;

  const Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isGroup = false,
    this.isMuted = false,
    this.messageType,
  });
}

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  final List<Chat> chats = [
    Chat(
      name: 'Aria Brooks',
      lastMessage: 'Sounds good, see you then!',
      time: '10:42 AM',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDDlzxzOvdNYegEEw_eL9PZMrQtNrG9YVd4B5701Iic4bs3wIqdO2H1WABWPYQlx7c8dYKkjO_j7A9wo3UG8-co850e0qxO9OC_EHZtpVZnwUkCRhKIbcKV3nKqtzYoucQmHL2NV3ZP6F5Yh17CNu6nuPSfQs0YjjHU39SUeW0yj9-X659-N08G-ZTGmGTGBwiRqN4hWLUDOUVY4vWFBg4-Xy5nwav1w12ENyXZfhxVQ5NaIYDs_olC6VcpiaAxVdoBMC1XqSIOsT_m',
      unreadCount: 2,
      isOnline: true,
    ),
    Chat(
      name: 'Liam Hayes',
      lastMessage: 'Can you send over the file?',
      time: '5m ago',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAw8xCxy452ncgRNzUYYAD2Qo7A4_-lr5eRhBHZPQlCEzHPiXkjyAeowjhL_Prmj30eu-tHk1YUNltyWeYieBLA-7O_tDwzaZ8_xE-0-n42c3pw8mndp65xWAMiiK4gbqqVJ8QdHGrwEos_pfQQx3Nl96vnoXyZgabnddNjR0OnkN_g_Fxtan99V2sfKQhXfC34gARMZIbWR1iDw8bB7pElzq8DQ8ovHzQvk_0sUWEqlqYamDmQOWJzcInFkR8OlrkOALKwnkSK8U4g',
    ),
    Chat(
      name: 'Design Team',
      lastMessage: 'Elena: Here is the latest version.',
      time: '1h ago',
      avatarUrl: '',
      unreadCount: 5,
      isGroup: true,
    ),
    Chat(
      name: 'Nora Chen',
      lastMessage: 'Photo',
      time: 'Yesterday',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAUWSZVmVidKGjowTNRMl7JlvescUpbGwefMlcV2uAi39WqvS9xtUwMaJBvbQIf-2gzSqkQ1VHvdaJSNy8b407NfegG2350HNKH523oYY3Lj5NgSYDz4Xv61bFIbsKX6_YxDHLeyg5v6z-9n_YP9WynF1MVFASvdU-Rt5xgwVUvWZ7MHKPCy04hW56R61EXm-EVyZ3coA542UFVv0N_B9iGA1UNlMMkQMSyTO2WZPxfusSW6g3AvSynnVWSC0xyC_bWG7zcXwaj16UV',
      messageType: 'photo',
    ),
    Chat(
      name: 'Marketing Updates',
      lastMessage: 'Sam: The new campaign is live!',
      time: '3:15 PM',
      avatarUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBIoQy-SdNWlXWJ_lvJuJdKpTbKtAwzgRRnNMzShOOzzntfS9zw2_6KiZoo_Y7X2fLsTxhL-jHQVpsc-sRmeuWXfOs7iFzCL3kdwBPZtSPbU7_vkOm7crGlOEKlmFK8u-KNilSEglWutb1NfQ2q7J5SuRvwD15AYeOKrqV6r6QelxfBCAWGQR5SJtecLsUZSKAP7KEFrBlIEZHBBPMO_yLQltSJ7YB4ENJPicZ_Zn5ztQ8LJJQzEUnqpq8lwn-bFvbIye80eYCYAKhq',
      isMuted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF008080);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
      body: Column(
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              color: (isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8))
                  .withOpacity(0.8),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAHmut2-E0wJby2BTB_ux6mAUR0BtFf5sUOEaiqzXQOgUUpZkbUd08LOksn1APlCqrirOpKMnGNlf-cCFNXf4IRDBLiMYnbaN-u3bcJDrm3ntRHw_xJ540gOp1kUKXa-oyA7hdeymvTGEiCYppBqtQPGUhF5BhKQHZIpHDxvYf2H6XdkwDyRA_9PrwpJj8czhlvSy8-P_fIAMVzUVfIwx_2qhoGbNHrV_SOt9EW8YQSZPIZfFdKgtCi6zOWbGHeThoizJ58wSuqni66',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Chats',
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),

          // Chat List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return _buildChatItem(chat, isDark, primaryColor);
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, size: 24),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildChatItem(Chat chat, bool isDark, Color primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen()));
            // Handle chat tap
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                // Avatar
                Stack(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: chat.isGroup
                            ? (isDark
                            ? const Color(0xFF115E59)
                            : const Color(0xFF99F6E4))
                            : null,
                        image: chat.avatarUrl.isNotEmpty
                            ? DecorationImage(
                          image: NetworkImage(chat.avatarUrl),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: chat.isGroup
                          ? Icon(
                        Icons.groups,
                        color: isDark
                            ? const Color(0xFF5EEAD4)
                            : const Color(0xFF0F766E),
                        size: 28,
                      )
                          : null,
                    ),
                    if (chat.isOnline)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark
                                  ? const Color(0xFF161022)
                                  : const Color(0xFFf6f6f8),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),

                // Chat Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: TextStyle(
                          color: isDark ? Colors.white : const Color(0xFF0F172A),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if (chat.messageType == 'photo')
                            Icon(
                              Icons.photo_camera,
                              size: 16,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF64748B),
                            ),
                          if (chat.messageType == 'photo')
                            const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              chat.lastMessage,
                              style: TextStyle(
                                color: isDark
                                    ? const Color(0xFF94A3B8)
                                    : const Color(0xFF64748B),
                                fontSize: 14,
                                fontWeight: chat.unreadCount > 0
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Time and Status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.time,
                      style: TextStyle(
                        color: chat.unreadCount > 0
                            ? primaryColor
                            : (isDark
                            ? const Color(0xFF94A3B8)
                            : const Color(0xFF64748B)),
                        fontSize: 12,
                        fontWeight: chat.unreadCount > 0
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (chat.unreadCount > 0)
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    else if (chat.isMuted)
                      Icon(
                        Icons.notifications_off,
                        size: 16,
                        color: isDark
                            ? const Color(0xFF64748B)
                            : const Color(0xFF94A3B8),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}