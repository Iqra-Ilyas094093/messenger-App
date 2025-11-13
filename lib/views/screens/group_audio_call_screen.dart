import 'package:flutter/material.dart';


class GroupAudioCallScreen extends StatefulWidget {
  const GroupAudioCallScreen({super.key});

  @override
  State<GroupAudioCallScreen> createState() => _GroupAudioCallScreenState();
}

class _GroupAudioCallScreenState extends State<GroupAudioCallScreen> {
  final List<Participant> participants = [
    Participant(
      name: 'Aarav',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCv0riItUJTFIsyVUmz_tCt1t4tE2GX0-enIN_Y8coQnDOMLQp2KMN0Yq_4ApWqsyE112ENHUsDNd-aWzVFMWlxjcDPjG5E17UC9wYdlYqAGIVt7GF8zpaF3_1E07dJYRzeg-naBQPZeYw2jhe86zlYvwo4acCPKGLtt87fU1oHrVZBO9Tc2RCaXuK4oDZmLMPqx7MY4r4s9YzqWOIoOHpqttxKszatvnLgwXZkXM9TFlzqsW_0QWjujVYc-AK8rHndIsYA9DUIrk18',
      isSpeaking: true,
      isMuted: false,
      isYou: false,
    ),
    Participant(
      name: 'Priya',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAdQNXET91hZVF_rH11wbdjE5xnO0SGd575FDl4xxTuLBE_Jg9Kj8PNSDPqMc5fct-L0Y2YMgDd1QvKd7gG1YdCgeCVl1NuQWKC0riauH3owiiKgkUN32Uu9CLRX66o78lb-vWcaYd0zWBlF0sD18_gSiV9rYud-aq9X4eU1gvJMXNoUvZslkJSnmm6KSbcCVRPTweiqp5ZclMrIiERHp3zmUlg_La4TlCcutKeKfZoY63eUmPFKWxoszfQR7vfPHMj9TsPKSqCxZLX',
      isSpeaking: false,
      isMuted: true,
      isYou: false,
    ),
    Participant(
      name: 'You',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAFCbUyK-buC8GXkvEOTR8otQfDvfLWpEB6E9tBY1F3hv8i_EECdT9Ey8xP-ybVLbYOhFcSLj2BDAxYsIO2UnQlH0gdI_Op9B_dM79zuiX4yw7P9G1hTLjHFnCDHhAhKgB5iKHoahSaqj8pDOwTPR8tvLBrgxzfK665aOCyjpxGhHEajTpAKRrYpkGkMm44AECzoIIkcLurZ3nWFUoXuNplF9iKkoJcHoWQOxHwtYw8iVvM71QnDvS-FwpDqTyXQp5_sSUycUo9LVcO',
      isSpeaking: false,
      isMuted: false,
      isYou: true,
    ),
    Participant(
      name: 'Rohan',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAtWVhEnbaGj2Gg8qU7miUCvvuD7DrVIICsmpjG_79LRpiYhRSbkZDYyj9F7uwnPfa8xKFM47qyaAeWyxVuwusYLCWu2bzDfqGtz8BPfUT-1_0z_qX3uj90gZm6SxGTrtdus-cl-XwG4JjaaKrLw4Gvb4BW7Q2bS9DF3PtnoUgeBhUQW9XwgigROBbZgYXPXyXDwlLNtpWaU_PJ6g_2L4NyQwdxcLicjemnaS7P2y51Xn9j3RvVNeSFVo6dDWjFVKkR-drgsk7_Ep54',
      isSpeaking: false,
      isMuted: false,
      isYou: false,
    ),
    Participant(
      name: 'Sonia',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDbNCBvlLxezn7-QHJxFwieeNkypu_FcmyBnG0HsyzIfvvDr8y_EEZr8TeR_Ib-MrM4zuMKL_IJfB1--UiSk80owVm6yiIu_oo8H-cY5r15nZ9coJ6-0QLwnyq5aE2TKJSAmn_L9mUakTpRYr88gJ9GgV1JkQW92YSWgdyq2DRosu13SciyDW2JelN5eTuIOr-aKJf9yDwHKI4BXipql88dcyaCO2mMsC87ZZXEjHWRV1Mli3cYuqftYCayOenD4x4BrbN4qa6Q5BwL',
      isSpeaking: false,
      isMuted: true,
      isYou: false,
    ),
    Participant(
      name: 'Vikram',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC_xNv9E0CTGky-SGTWC6J-g2pa0POtUNMQRL22tmXtzHCytUOs3AShZvBuHgGb0XUG67z0s3JapP5G2-rhi09XsrRnFAyxivmEDJv9rcVGdKcAmK6kn1-fHhtmmQKU96ysbqTTN3mNrmGY9nQrMTewJd_9e7DAhtnQQU7MCeoxSNrI8m6PC0v3rE2sb6mCxavmThvSFLCp5C07vPw145Nrp-4Vu4nhWUR5A9QyTW4u_rqiFQ-UmQlyxyOGpkTpDSZXXASvLHORqmib',
      isSpeaking: false,
      isMuted: false,
      isYou: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(colorScheme),

            // Participant Grid
            Expanded(
              child: _buildParticipantGrid(colorScheme),
            ),

            // Actions Bar
            _buildActionsBar(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: Icon(
                Icons.expand_more,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Design Team Sync',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Spline Sans',
              ),
            ),
          ),

          // Timer
          SizedBox(
            width: 68,
            child: Text(
              '01:23:45',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Spline Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantGrid(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: participants.length,
        itemBuilder: (context, index) {
          final participant = participants[index];
          return _buildParticipantItem(participant, colorScheme);
        },
      ),
    );
  }

  Widget _buildParticipantItem(Participant participant, ColorScheme colorScheme) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Active speaker indicator
            if (participant.isSpeaking)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.primary,
                    width: 4,
                  ),
                ),
              ),

            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(participant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Mute indicator
            if (participant.isMuted)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mic_off,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          participant.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: participant.isYou
                ? colorScheme.primary
                : participant.isMuted
                ? Colors.white.withOpacity(0.7)
                : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Spline Sans',
          ),
        ),
      ],
    );
  }

  Widget _buildActionsBar(ColorScheme colorScheme) {
    final actions = [
      _ActionItem(icon: Icons.person_add, label: 'Add'),
      _ActionItem(icon: Icons.mic, label: 'Mute'),
      _ActionItem(icon: Icons.call_end, label: 'End', isDanger: true),
      _ActionItem(icon: Icons.volume_up, label: 'Speaker'),
      _ActionItem(icon: Icons.people, label: 'List'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.background.withOpacity(0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((action) => _buildActionButton(action, colorScheme)).toList(),
      ),
    );
  }

  Widget _buildActionButton(_ActionItem action, ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: action.isDanger
                ? Colors.red
                : colorScheme.primary.withOpacity(0.2),
          ),
          child: Icon(
            action.icon,
            color: action.isDanger ? Colors.white : colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          action.label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Spline Sans',
          ),
        ),
      ],
    );
  }
}

class Participant {
  final String name;
  final String imageUrl;
  final bool isSpeaking;
  final bool isMuted;
  final bool isYou;

  Participant({
    required this.name,
    required this.imageUrl,
    required this.isSpeaking,
    required this.isMuted,
    required this.isYou,
  });
}

class _ActionItem {
  final IconData icon;
  final String label;
  final bool isDanger;

  _ActionItem({
    required this.icon,
    required this.label,
    this.isDanger = false,
  });
}