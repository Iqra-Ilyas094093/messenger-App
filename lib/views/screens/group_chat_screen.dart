import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/group_audio_call_screen.dart';
import 'package:messenger_app/views/screens/group_details_screen.dart';
import 'package:messenger_app/views/screens/group_video_call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Chat - Design Team Sync',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF11D4D4),
          background: const Color(0xFFF6F8F8),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Spline Sans'),
          bodyMedium: TextStyle(fontFamily: 'Spline Sans'),
          titleLarge: TextStyle(fontFamily: 'Spline Sans'),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF11D4D4),
          brightness: Brightness.dark,
          background: const Color(0xFF102222),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Spline Sans'),
          bodyMedium: TextStyle(fontFamily: 'Spline Sans'),
          titleLarge: TextStyle(fontFamily: 'Spline Sans'),
        ),
      ),
      home: const GroupChatScreen(),
    );
  }
}

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF11D4D4);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF102222) : const Color(0xFFF6F8F8),
      body: Column(
        children: [
          // Top App Bar
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF102222).withOpacity(0.8)
                  : const Color(0xFFF6F8F8).withOpacity(0.8),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            child: BackdropFilter(
              filter: const ColorFilter.mode(Colors.transparent, BlendMode.srcOver),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuANo4rlE1w6D1zSL-jL88h9ntiRAHLsHzc92ZD-1SnEeFA1O8u458il0qhiQOi1qmknXiVKS3F2rzmUEoyyoXRHYtwcykqsB2EkkcTL5Xdnc-efB7CuFnxyzegrlhAsic2QdvZoblGjG8-Hir-HxSibiGLGnjqYMY027CJ2ZsHuv6wAifyXEUECFW2lnTFRA3yX2XsC_2ZvMZPlPb2KPRu6SOlzPwdjZn_wo7OgU1RD3VDzbuqBhnfUwymJRSt-U_Y9wY-4vgJ7i4bF',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GroupDetailsScreen()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Design Team Sync',
                              maxLines: 2,
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Spline Sans',
                              ),
                            ),
                            Text(
                              '12 Members',
                              style: TextStyle(
                                color: isDark ? const Color(0xFF92C9C9).withOpacity(0.8) : Colors.grey[600],
                                fontSize: 14,
                                fontFamily: 'Spline Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GroupAudioCallScreen()));
                      },
                      icon: const Icon(Icons.call),
                      color: isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8),
                    ),IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GroupVideoCallScreen()));
                      },
                      icon: const Icon(Icons.video_call),
                      color: isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      color: isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Message List Area
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                // Today Label
                _buildDateLabel('Today'),

                // Message from Alex Chen
                _buildOtherUserMessage(
                  name: 'Alex Chen',
                  message: 'Hey team, just wanted to follow up on the new mockups. I\'ve attached them here. Let me know what you think! Especially you @currentUser.',
                  avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCMBdxGxOF0vMkm8jRdA66eWSVFt5izvtfdeTIJNaLGRzhQ9R_sdQ4PkpKMwh01MkdmF1dB6TZv0ETVJFNBWIzsA-U8o2yjFvSAIsVC8jLvfYK1g1lY6TIHu9mmR8eUbvftFa3wJ_aoiu5h0GsTEM_jqAUyE_oMHcL8RoVbCtvZjfiuXsmyH-iGKbA-JzzZXBRw8O58My6ytSb_U5es0eZ25oF8NtJCrpl_bPdmEl0m71-OMDXuFYjD69Ff8kZn7xZrCWEZFjddOWzs',
                  hasAttachment: true,
                  attachmentUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDEIQ1nfatslj1uhG20NoEtyi9MtKVIMdNVvx9w4cJovhrpmfzNoeQMSQr9Ms84BhC97qHxDndwXUZChFJ8ZKx-Awfv05OCQABFoj4pL5E_D0b5Q5RDNTAR1mgCN033dy8Aclgl9cm73i_zoX4z5R4jzXFn4XshwKGgqworZBBGDgdXkRCOg-UPuHxdOQs1hQADgkjC8ejLkr7JdgjFNSbL0b_tmwDZ9Gt-CaGcx3LrMHtYkYVNtGYJzY0xiSLb5oThpfEIpkT-g-xI',
                ),

                // Message from current user
                _buildCurrentUserMessage(
                  message: 'Looks great Alex! The deep teal really pops. I\'ll take a closer look this afternoon.',
                ),

                // Message from Sarah Lee
                _buildOtherUserMessage(
                  name: 'Sarah Lee',
                  message: 'Amazing work! I\'ve added Ben to the chat so he can see them too.',
                  avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCYktro-9eFN9yP1xiXy0u1NRIB4orncqXRF-LGTdx0T3gdwgb6xj0vdRCGeSnoZbBvGIiXsnxEoQ_3-aHTqOXWyuCBImoubM9uJHRY66X_LAYLSFYr9P3sAeXYEzHN_rL0L_xiWikyrJUFPlIJZzOmLmiDqUELmHaL3-vf-zFJxe5AhbbeMrdMvXTGxLPx82dyGWk5ZhcF12TyisQRis6rzemhvr52YIjVTUNolBxMQMiEc3vyZcy1X_aZXMI_lrSMYsDtls5jPO-P',
                ),

                // User added label
                _buildDateLabel('Sarah Lee added Ben Carter'),

                // Message from Ben Carter
                _buildOtherUserMessage(
                  name: 'Ben Carter',
                  message: 'Thanks for the add! These mockups look solid. The data visualization is very clear.',
                  avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCENSZxw_sBV8aWvmB_KGHwBnosJqxjNUOB7rCVvNwXmaAf9fev08hhWt9Z-NjSHjU6UcLbGW4u8jrGNqZwEQVLLlcTgBrFOfp5iL7SyhxL5XtcEBlfrYU7PIW72HIgehE3Gs-h0sWKsy1Iuz8VH44AmB4qsTLR4dQAqhVdnQpuSBelYfn8k-gbq2TbefNhH1qtDoOF5gxcm7uJAKR1mNXWosad5BTaCGt9SdZwZOahAOiNCSVE5mfAooWLkBtjjvGp8Oogc62qMhuo',
                ),

                // Typing Indicator
                _buildTypingIndicator(),
              ],
            ),
          ),

          // Input Field Area
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF102222).withOpacity(0.8)
                  : const Color(0xFFF6F8F8).withOpacity(0.8),
            ),
            child: BackdropFilter(
              filter: const ColorFilter.mode(Colors.transparent, BlendMode.srcOver),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle),
                      color: isDark ? Colors.white.withOpacity(0.7) : Colors.grey[500],
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Message #design-team-sync',
                            hintStyle: TextStyle(
                              color: isDark ? Colors.white.withOpacity(0.5) : Colors.grey[500],
                              fontFamily: 'Spline Sans',
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.emoji_emotions_outlined),
                              color: isDark ? Colors.white.withOpacity(0.7) : Colors.grey[500],
                            ),
                          ),
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontFamily: 'Spline Sans',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (_messageController.text.trim().isNotEmpty) {
                            // Handle send message
                            _messageController.clear();
                          }
                        },
                        icon: const Icon(Icons.send),
                        color: const Color(0xFF102222),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 14,
          fontFamily: 'Spline Sans',
        ),
      ),
    );
  }

  Widget _buildOtherUserMessage({
    required String name,
    required String message,
    required String avatarUrl,
    bool hasAttachment = false,
    String? attachmentUrl,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isDark ? const Color(0xFF92C9C9) : Colors.grey[600],
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Spline Sans',
                  ),
                ),
                const SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF234848) : Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'Spline Sans',
                        ),
                      ),
                    ),
                    if (hasAttachment && attachmentUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(attachmentUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentUserMessage({required String message}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF11D4D4);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: const Color(0xFF102222),
                      fontSize: 16,
                      fontFamily: 'Spline Sans',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF11D4D4);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBsoje4XDabOn1PiaUSLXqjCnsWxlgW-xF3kC-7RM3FasjVhYPMhF32BpmKYgSkOwQ76W9JYOri3I2SPdHvXPzBzpXIaGjeWGOCYvbstMegTIDoUW_MeqtbcDvsLW_mNoQuLUydL_ecLWHzjZrmww94YG3x3f-MZy-teAXVRcj-9QVudHP9puIWPNifN03zAgUgyMDlJrkkkCW8jX_6izueHGcCyaBfTBlh5s7v2G_T94Cc_ttgj06zQ4fiQo7iN2uySauDaG7SvqNk',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF234848) : Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(0),
                _buildTypingDot(1),
                _buildTypingDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    final primaryColor = const Color(0xFF11D4D4);

    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: index < 2 ? 4 : 0),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}