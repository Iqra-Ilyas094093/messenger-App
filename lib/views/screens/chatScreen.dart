import 'package:flutter/material.dart';
import 'package:messenger_app/views/screens/audio_call_screen.dart';
import 'package:messenger_app/views/screens/contact_detail_screen.dart';
import 'package:messenger_app/views/screens/incoming_call_screen.dart';
import 'package:messenger_app/views/screens/video_call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark ? const Color(0xFF161022) : Colors.white;
    final Color surfaceColor = isDark ? const Color(0xFF2f2348) : Colors.grey[100]!;
    final Color textColor = isDark ? Colors.white : const Color(0xFF161022);
    final Color secondaryTextColor = isDark ? const Color(0xFFa492c9).withOpacity(0.8) : Colors.grey[600]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header
          _ChatHeader(
            backgroundColor: backgroundColor,
            textColor: textColor,
            secondaryTextColor: secondaryTextColor,
          ),

          // Messages List
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: const [
                _DateDivider(),
                SizedBox(height: 8),
                _ReceivedMessage(
                  message: "Hey, how are you doing? Just checking in. I saw your latest post, it looked amazing!",
                  showAvatar: true,
                ),
                SizedBox(height: 8),
                _SentMessage(
                  message: "I'm doing great, thanks for asking! Glad you liked the post. How have you been?",
                ),
                SizedBox(height: 8),
                _ReceivedMessage(
                  message: "Been busy with work, but it's all good. We should catch up soon!",
                  showAvatar: true,
                ),
                SizedBox(height: 8),
                _ReceivedMessageWithAttachment(),
                SizedBox(height: 8),
                _SentMessageWithReadReceipt(),
                SizedBox(height: 8),
                _ReceivedMessageWithFile(),
              ],
            ),
          ),

          // Message Input
          _MessageInput(
            controller: _messageController,
            onSend: () {
              if (_messageController.text.trim().isNotEmpty) {
                // Handle send message
                _messageController.clear();
              }
            },
            backgroundColor: backgroundColor,
            surfaceColor: surfaceColor,
            textColor: textColor,
            secondaryTextColor: secondaryTextColor,
          ),
        ],
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color secondaryTextColor;

  const _ChatHeader({
    required this.backgroundColor,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          // Back Button and User Info
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: textColor,
          ),
          const SizedBox(width: 2),
          // User Avatar with Online Status
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuD2tV-208ByF--Svhi-4q97aUKOdbWTqtjFMTLsdvXSKC68WjW6HCxnnCi3BWfJXgKD5Jt7iepAB6l0_QDqcf7lt2skDJVCRjVEOcOv75pWCxa7mMLmRKvai3wD9-Kz1ERC8li-q8mhT-ULZfwuN7GNRc9TZ6748MzCU_idTK40dHg3V_hYODmAftCVcLA5WYgld-9xBxB4I1eZ-rchMlgs9TnM3-dmHcEtB-X4pZlNtrvkU-a9Ym6p5y6lBAjRstdwRV3t6bU5mmQj",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: backgroundColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // User Info
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ContactDetailsScreen()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Elara Vance",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AudioCallScreen()));
                },
                icon: const Icon(Icons.call),
                color: textColor.withOpacity(0.8),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>VideoCallScreen()));
                },
                icon: const Icon(Icons.videocam),
                color: textColor.withOpacity(0.8),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: textColor.withOpacity(0.8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? const Color(0xFFa492c9).withOpacity(0.7) : Colors.grey[600]!;

    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.white.withOpacity(0.1)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Today",
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.white.withOpacity(0.1)),
        ),
      ],
    );
  }
}

class _ReceivedMessage extends StatelessWidget {
  final String message;
  final bool showAvatar;

  const _ReceivedMessage({
    required this.message,
    required this.showAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showAvatar)
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuBQ2XJyGpEGzL9Y7uuI2oLyN29b7aM7b-85K-K2izFHQsUOxjUlOjXgst9Ar5T78po2w8uv0snz63szY-0RKw1C5k53P2HjxbNhzi9Vf-TJKUfTZvrYHlghw4zh0tehp6pY3VEnSvi2YYw2nBWPrOtipj2IciB2f062l704vqlDVXiWtFNk12gufP1D2lKwijkcQmWtzYkCOuTXOWsHQV-BdgRFCLroh7vr0q16KM-vr7y089a0ZLoBOY3aGvPvUvMx8g4BWPmkSGSV",
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          const SizedBox(width: 44),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2f2348),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SentMessage extends StatelessWidget {
  final String message;

  const _SentMessage({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF008080),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReceivedMessageWithAttachment extends StatelessWidget {
  const _ReceivedMessageWithAttachment();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuCJtAui4ChVgejOdnkmY_gh4uEpaUyB_qpucUnmUIyHpUonRIrSAwamE6ZnHYkgu92rtgO2jc0eMOfHJt1R_I8fBtqs7shQjuze5uKpWwveA7KemWu5Gio7ZfuShfVCb_-dzq2rJYeGMqEuF0Ne11ibiDBY2wUfJNr6qGmbhk3C3b8CJ4wil9CizRCdAcs4b9jzAGXSM8DnKfTvSxERhtrUbyTvd19UvfAS9gNSFLW7AympHpVXpNOOQ4DkCwk8ZjBXvtxUMbsupz3c",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Message Text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2f2348),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const Text(
                  "Been busy with work, but it's all good. We should catch up soon!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Attachment Card
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2f2348),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  children: [
                    // Image
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://lh3.googleusercontent.com/aida-public/AB6AXuDs3UNwoY-ZB3BI-p_JeOanEV6Qyua6xO0PubJXIVkzz9mCvQt3_1933VqZqUIavNtXaMq7psMJWLMJptMt-tXtCsBcXfLOSDgjmnohkTG_BaJfadBsNlNAh6m8p9IwDTgpEEI-iDogg7urVamBb_dk569L7OZELm-8ksG_RFgs-rwZOQxigWayImcpnwbkH6JV-Cga5ApEX1j0zF-6TZVADe7CCrnLCkaF5zFG7bgsZOp95hHfe3E5NrJ0NqCD9b66mwH9tprrxiIV",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Text Content
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SOCIAL MEDIA SHARE",
                          style: TextStyle(
                            color: Color(0xFFa492c9),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "My latest travel adventure! 🌍",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // View Button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF008080).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.visibility,
                            size: 16,
                            color: Color(0xFF008080),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "View Post",
                            style: TextStyle(
                              color: const Color(0xFF008080),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SentMessageWithReadReceipt extends StatelessWidget {
  const _SentMessageWithReadReceipt();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF008080),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    "Absolutely! Let me know when you're free.",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.done_all,
                  color: Color(0xFF80deea),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ReceivedMessageWithFile extends StatelessWidget {
  const _ReceivedMessageWithFile();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuCOd7SfV26EHWhnEUCLdMUxZL-0LsF3DW-wu98ckVtMM7A2KbEnU1hcRTOVxuAzOe9wM_TqQFfCaP3Y2hCT7GmzqyCx5tEvSI7X_yRS5mIRq4Iia3GQZvI-GIEdHJnK-J5vKK5O1EAHh8aSU9bSgXrgxprO-p4xkbBS6Zf3mqlZaIKtETSB6L22U_-7ogbobKhxQQljXWBW85oVqa2P9ak5iFX3Ljl8_dDrBKxY2rvz1zRfCfN0RZFf78YDgBtbX-1a3jiXFYLrEhTR",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // File Attachment
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2f2348),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF008080).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.description,
                        color: Color(0xFF008080),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "project-brief.pdf",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "1.2 MB",
                            style: TextStyle(
                              color: Color(0xFFa492c9),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Typing Indicator
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2f2348),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TypingDot(delay: -0.3),
                    _TypingDot(delay: -0.15),
                    _TypingDot(delay: 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TypingDot extends StatelessWidget {
  final double delay;

  const _TypingDot({required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color textColor;
  final Color secondaryTextColor;

  const _MessageInput({
    required this.controller,
    required this.onSend,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        children: [
          // Add Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
            color: const Color(0xFF008080),
          ),
          // Message Input
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF2f2348),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  // Left Icons
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file),
                    color: const Color(0xFF008080).withOpacity(0.7),
                  ),
                  // Text Field
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(
                          color: secondaryTextColor,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  // Right Icons
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions),
                    color: const Color(0xFF008080).withOpacity(0.7),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic),
                    color: const Color(0xFF008080).withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          // Send Button
          const SizedBox(width: 8),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF008080),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF008080).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              onPressed: onSend,
              icon: const Icon(Icons.send),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}