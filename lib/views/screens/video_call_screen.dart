import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isMuted = false;
  bool _isVideoOff = false;
  bool _isFrontCamera = true;
  Duration _callDuration = const Duration(minutes: 14, seconds: 21);

  @override
  void initState() {
    super.initState();
    // Start timer for call duration
    _startTimer();
  }

  void _startTimer() {
    // In a real app, you would use a Timer to update the duration
    // For demo purposes, we'll just display static time
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  void _toggleVideo() {
    setState(() {
      _isVideoOff = !_isVideoOff;
    });
  }

  void _toggleCamera() {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
    });
  }

  void _addCall() {
    // Handle add call functionality
  }

  void _endCall() {
    // Handle end call functionality
    Navigator.of(context).pop();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main Video Feed (Other Participant)
          _MainVideoFeed(),

          // Overlay
          Container(
            color: Colors.black.withOpacity(0.1),
          ),

          // UI Overlays
          _VideoCallOverlay(
            callDuration: _callDuration,
            isMuted: _isMuted,
            isVideoOff: _isVideoOff,
            isFrontCamera: _isFrontCamera,
            onToggleMute: _toggleMute,
            onToggleVideo: _toggleVideo,
            onToggleCamera: _toggleCamera,
            onAddCall: _addCall,
            onEndCall: _endCall,
          ),
        ],
      ),
    );
  }
}

class _MainVideoFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCxKycQ37vp3oiFBPyIDfn_j28FkWanofW3YSO0Yze3-jPczqABU1HYBTo_ZPXgUtqlj7-tZEOLFoGYHjTuLrEKV4JG-HZPIFpablYcfRR9FW8M_yyV0cYgKsrCIpJSqGw4h4YlfSRF9OfDXN2v7ZPkzb4RLkavI-mNQsripreRxXTxPius3xN3eCnh_QZ89CkvsYjU5_MITlcxGxOeAGKJ4AsoDnf2IoxBMOj_GLtuP4prQivnmHlGvRjpWiSJZkaR97TPkovBJ6Uz',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _VideoCallOverlay extends StatelessWidget {
  final Duration callDuration;
  final bool isMuted;
  final bool isVideoOff;
  final bool isFrontCamera;
  final VoidCallback onToggleMute;
  final VoidCallback onToggleVideo;
  final VoidCallback onToggleCamera;
  final VoidCallback onAddCall;
  final VoidCallback onEndCall;

  const _VideoCallOverlay({
    required this.callDuration,
    required this.isMuted,
    required this.isVideoOff,
    required this.isFrontCamera,
    required this.onToggleMute,
    required this.onToggleVideo,
    required this.onToggleCamera,
    required this.onAddCall,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar
        _TopBar(callDuration: callDuration),

        // Self View (PiP)
        const Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 96, right: 16),
              child: _SelfView(),
            ),
          ),
        ),

        // Bottom Control Bar
        _ControlBar(
          isMuted: isMuted,
          isVideoOff: isVideoOff,
          isFrontCamera: isFrontCamera,
          onToggleMute: onToggleMute,
          onToggleVideo: onToggleVideo,
          onToggleCamera: onToggleCamera,
          onAddCall: onAddCall,
          onEndCall: onEndCall,
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  final Duration callDuration;

  const _TopBar({
    required this.callDuration,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        children: [
          // Caller Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alex Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.015,
                  ),
                ),
                Text(
                  _formatDuration(callDuration),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // Expand Button
          IconButton(
            onPressed: () {
              // Handle expand/minimize
            },
            icon: Icon(
              Icons.expand_more,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelfView extends StatelessWidget {
  const _SelfView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCuDMxNAjf6KR6xUUQTq8bbQeSFavVgoqsz7sucmPBnDWFqmyvGSfBrMpT3-LTpU-4DUN23sk6qxpkGtNE6dnL6-mHQqKg0n4cdC2MTPdPKHrUGujE6hwU-SW2B4tlpkIjKzCYdCGgHgstRSsnxxCZNHYkt-rMoOgFjh0avyNXxRvW8rIq7pfzCI_OCNleYWNk_Z478nVOkE8toaDKJWvWj7rUAZp82GtiyGP-XOsSTf0Glu3K9Ih2_UAc8ynmIwGtyMWt2cWUwO7CC',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _ControlBar extends StatelessWidget {
  final bool isMuted;
  final bool isVideoOff;
  final bool isFrontCamera;
  final VoidCallback onToggleMute;
  final VoidCallback onToggleVideo;
  final VoidCallback onToggleCamera;
  final VoidCallback onAddCall;
  final VoidCallback onEndCall;

  const _ControlBar({
    required this.isMuted,
    required this.isVideoOff,
    required this.isFrontCamera,
    required this.onToggleMute,
    required this.onToggleVideo,
    required this.onToggleCamera,
    required this.onAddCall,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mute Button
          _ControlButton(
            icon: isMuted ? Icons.mic_off : Icons.mic,
            backgroundColor: Colors.white.withOpacity(0.2),
            onPressed: onToggleMute,
            size: 56,
          ),

          const SizedBox(width: 24),

          // Video Button
          _ControlButton(
            icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
            backgroundColor: Colors.white.withOpacity(0.2),
            onPressed: onToggleVideo,
            size: 56,
          ),

          const SizedBox(width: 24),

          // Add Call Button
          _ControlButton(
            icon: Icons.add_call,
            backgroundColor: const Color(0xFF04aeae),
            onPressed: onAddCall,
            size: 56,
          ),

          const SizedBox(width: 24),

          // Flip Camera Button
          _ControlButton(
            icon: Icons.flip_camera_android,
            backgroundColor: Colors.white.withOpacity(0.2),
            onPressed: onToggleCamera,
            size: 56,
          ),

          const SizedBox(width: 24),

          // End Call Button
          _ControlButton(
            icon: Icons.call_end,
            backgroundColor: Colors.red,
            onPressed: onEndCall,
            size: 64,
            iconSize: 32,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;

  const _ControlButton({
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
    required this.size,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          if (backgroundColor == Colors.red)
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}