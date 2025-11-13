import 'package:flutter/material.dart';

class GroupVideoCallScreen extends StatelessWidget {
  const GroupVideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102222),
      body: Column(
        children: [
          // Top App Bar
          _buildTopAppBar(),


          // Video Grid
          _buildVideoGrid(),

          // Bottom Controls
          _buildBottomControls(),
        ],
      ),
    );
  }

  Widget _buildVideoGrid() {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        _VideoTile(
          name: 'Aria',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuASH3pzuRjM8qL22N1mR1MvxBQr7mnlGsDOlFRep6mTAj2V4b3Xf4s5pz88sOSfDL7azjILoDxYinWgEFpKXmWrgYw5Q4fDvVkOgOrwK9cpfSi2-VzDl_zwfpO2RZC_0dL8ApFDgeHE1AVCHGXcITNS3Gsrv24ofbVz2wPnsZ6-LVcIt-XyLXdUs_tWeQaguln-CcbrxO4NOhhnuUz45zrjrxcEwbIGw3_0V2fIRM63Ja5TrlvQFCAqXseRubxK7E52uUGOe1rhw8vl',
        ),
        _VideoTile(
          name: 'Ben',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3Q-_cq16e2tj5WwRw8YN6Sq-PFLdyhyWy-0MEHf3tLOHY--EOelVgwZA-KPCHdF5831ieF7xPwpAUc48ybBZzwzzNVnHAa1_ynARH3PSEZL0IaIpMGzrlU2jxqTWDliZb8v9DvUfv3PKGFeSRkfjJKvUrfvWQSMrkgoG2X3k3IjcYqJ_k7UXu2ahnw53EsA2KCqvwynryMS-gSMQ-fMEn6D6L72jPG49d4rPUiSd1Q886PemedVCi5vSxBgVpugovjQHqfLU4Nh64',
          isSpeaking: true,
          isMuted: true,
        ),
        _VideoTile(
          name: 'Chloe',
          hasVideo: false,
          isVideoOff: true,
        ),
        _VideoTile(
          name: 'David',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDTH-0C1o05mkDrmrnLIT8Nm4yBgGZrZVXISm7_EwHTcBnSfEvC9BDwYS9yHT6jHXym3Xa1_4NRasBapjnZh02fbKQVA8FrxM8BygQuTE_sbrjLxPSTyPYysKEqQrWylVuYQcHrNneBW6WHrf9vTC3Xmw5V29by6exb94YDq_PS7ich7PBA2QO-KoVRZzPZvh6_WdmOvjXEoQOQNF4t6aoUWknYPK3eL8QuHrvLtJDQBEdQ2h7qrQOjmFfUJnwyq4en7Fi48EdiIy3',
        ),
      ],
    );
  }

  Widget _buildTopAppBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.expand_more, color: Colors.white, size: 28),
              const SizedBox(width: 14),
              const Text(
                'Project Phoenix Team',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Spline Sans',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '01:23:45',
                style: TextStyle(
                  color: const Color(0xFF11d4d4),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Spline Sans',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Actions Bar
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: Icons.screen_share,
                  label: 'Share',
                ),
                _ActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Chat',
                ),
                _ActionButton(
                  icon: Icons.group,
                  label: 'Participants',
                ),
                _ActionButton(
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Button Group
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ControlButton(
                  icon: Icons.mic,
                  backgroundColor: const Color(0xFF234848),
                ),
                const SizedBox(width: 16),
                _ControlButton(
                  icon: Icons.videocam,
                  backgroundColor: const Color(0xFF234848),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.call_end, color: Colors.white, size: 28),
                        const SizedBox(width: 8),
                        Text(
                          'End Call',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Spline Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoTile extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool hasVideo;
  final bool isSpeaking;
  final bool isMuted;
  final bool isVideoOff;

  const _VideoTile({
    required this.name,
    this.imageUrl,
    this.hasVideo = true,
    this.isSpeaking = false,
    this.isMuted = false,
    this.isVideoOff = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isSpeaking
            ? Border.all(
          color: const Color(0xFF11d4d4),
          width: 2,
        )
            : null,
        boxShadow: isSpeaking
            ? [
          BoxShadow(
            color: const Color(0xFF11d4d4).withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ]
            : null,
      ),
      child: Stack(
        children: [
          if (hasVideo && imageUrl != null)
            Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          else
            Container(
              color: const Color(0xFF1f1f1f),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          // Name overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Spline Sans',
                ),
              ),
            ),
          ),
          // Status icons
          if (isMuted || isVideoOff)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  isMuted ? Icons.mic_off : Icons.videocam_off,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Spline Sans',
          ),
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;

  const _ControlButton({
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}