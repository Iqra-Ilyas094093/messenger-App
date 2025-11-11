import 'package:flutter/material.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({super.key});

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  CallFilter _selectedFilter = CallFilter.all;
  final List<CallHistoryItem> _callHistory = [
    CallHistoryItem(
      name: 'Sarah Connor',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCLTLrGwlaxj8TzHiuiyGNqGh0UStsU05b2RBc5kGvI8_6XyWyJzDdjFuHUqHfMWauaNzNXj5ix4_Z2Y_3FagGQp48Rm0AJw8Ln3I3jCHFdEzFhnKyDbnjmXlgkygJkkacOSS9nq0g6p-oPOzgr1kJPprZUzuGm2be_VrZI7Oc4yx5jp5MAIYepEu-x0M-IakMi-9IcpoW87Lu9ggUWNdE4qXChOGro80DJO9IyWXhlG_dbez6NPBSaJ4kHZoZ1gJw_hanCMd-rkvAQ',
      callType: CallType.missed,
      timestamp: '1h ago',
      isVideoCall: true,
    ),
    CallHistoryItem(
      name: 'John Smith (2)',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB8Ay9nnZFyAMfw9XYslLDdgMnLzks8ooTrOL5WOPuR7iieRQdbopWYHDXaS-u-nL7rMKiL9xole5Zdlitjhlex5ReF2OTJEaDtFXJ8S1FkXZCHjkc0gBkHMNXD1qUCKanpLK2YbMc816qUeIxSqHf9DdUsgI42sk2nUfRS3biwIrZpvHC4MRvVyfOz6pPRYj0y3Xi1wFWMcSZDkhejgpYBd89rPo1DJvbZ12LEZCz5Y_LV3ZaefpiJK8PG-GbCQl6irqlgi70V0QJJ',
      callType: CallType.outgoing,
      timestamp: 'Yesterday, 9:45 PM',
      isVideoCall: false,
    ),
    CallHistoryItem(
      name: 'Maria Garcia',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCY1-p0fgW-wAC5CUSf8R6fdU3fo8oEkXtfmEGeoZ4BsK8lq80JBpL9mvrd3OVzZlqh43sPn_7PK-nxn11NLauhEoUBtnsKsvNoFXl4nGjDtsqPHq9ULkj1SrjDsMvF2jfj0EZDoYvDbW037V70ZMZz9iGMAmJBulDEh01Dr8wh9VtHXrvL_F8B32C3W3sjVS4v_hf8HsXG-mS3XtUTijSqg9ihGhAl6715YVO8tJu2NyKltLpcgIpQiPKEwhnhEoEdxhfWSv2F41QW',
      callType: CallType.incoming,
      timestamp: 'Yesterday, 8:12 PM',
      isVideoCall: false,
    ),
    CallHistoryItem(
      name: 'Alex Ray',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA-YlBlLm8yfnseF7_yB0QLsPmbYY7ePWqAPibGpvaUoHYctvLHUb6bHTnJQ8OTbYTTAxHLgaA4oSbdwmf9qFWUJ0H1OkiVaAb3JFqHvzpRfRw1_akIktpCuSG9a9hYGBgoqMJYG8SGH2PjOsHEJFwwH3IGWzlTm6cP0BXZLM-zoEMypeGLad9s1ezg-0XYae_hZSp_aXblEPlCzJCe3FHhkG0hHyUA53UxHRfNteCWHIMjONcmOuaaEKZv2O63bTzeA8-JuHJDyqkn',
      callType: CallType.outgoing,
      timestamp: 'Oct 29',
      isVideoCall: true,
    ),
    CallHistoryItem(
      name: 'Jane Doe',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCnrF3cBE8bStgauijXAGE3tdyomACRllVYXPL5vQdYL4XUEYRKXccoN4LjRvEgctoYPulj-KYReIojV1TyMLQgYigbzfcuwkLUka83GDaHbWlvG3G1Eg5E6TCjysJEZxs0_2FrqvMl5fxFCoBWQpfqLRL4vui2a2lXEjWgJ1JoSPo0OeeXyCEYtKH-Vm-r2gRt8fXB7HEcF0SS2UnCwjTrQ20wKWseC-ak2MpwEAODQytUhYao88fIU8ZiEgn7oZDRVhagglPug7kS',
      callType: CallType.incoming,
      timestamp: 'Oct 28',
      isVideoCall: false,
    ),
  ];

  List<CallHistoryItem> get _filteredCalls {
    if (_selectedFilter == CallFilter.all) {
      return _callHistory;
    } else {
      return _callHistory.where((call) => call.callType == CallType.missed).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : const Color(0xFF0f2323);
    final Color secondaryTextColor = isDark ? Colors.grey[400]! : Colors.grey[600]!;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new call
        },
        backgroundColor: const Color(0xFF04aeae),
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
          size: 28,
        ),
      ),
      body: Column(
        children: [
          // Top App Bar
          _TopAppBar(
            textColor: textColor,
            onBack: () {
              Navigator.of(context).pop();
            },
            onSearch: () {
              // Handle search
            },
          ),

          // Segmented Buttons
          _FilterSegments(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),

          // Call List
          Expanded(
            child: _filteredCalls.isEmpty
                ? const _EmptyState()
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredCalls.length,
              itemBuilder: (context, index) {
                return _CallListItem(
                  call: _filteredCalls[index],
                  textColor: textColor,
                  secondaryTextColor: secondaryTextColor,
                  onCallPressed: () {
                    // Handle call
                  },
                  onVideoCallPressed: () {
                    // Handle video call
                  },
                  onInfoPressed: () {
                    // Handle info
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum CallFilter { all, missed }

enum CallType { incoming, outgoing, missed }

class CallHistoryItem {
  final String name;
  final String avatarUrl;
  final CallType callType;
  final String timestamp;
  final bool isVideoCall;

  const CallHistoryItem({
    required this.name,
    required this.avatarUrl,
    required this.callType,
    required this.timestamp,
    required this.isVideoCall,
  });
}

class _TopAppBar extends StatelessWidget {
  final Color textColor;
  final VoidCallback onBack;
  final VoidCallback onSearch;

  const _TopAppBar({
    required this.textColor,
    required this.onBack,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:const Color(0xFF161022),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Calls',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterSegments extends StatelessWidget {
  final CallFilter selectedFilter;
  final ValueChanged<CallFilter> onFilterChanged;

  const _FilterSegments({
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color activeTextColor = isDark ? Colors.white : const Color(0xFF0f2323);
    final Color inactiveTextColor = isDark ? Colors.grey[400]! : Colors.grey[500]!;
    final Color backgroundColor = isDark ? Colors.black.withOpacity(0.2) : Colors.grey[200]!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // All Filter
            Expanded(
              child: GestureDetector(
                onTap: () => onFilterChanged(CallFilter.all),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFilter == CallFilter.all
                        ? Theme.of(context).colorScheme.background
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: selectedFilter == CallFilter.all
                            ? activeTextColor
                            : inactiveTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Missed Filter
            Expanded(
              child: GestureDetector(
                onTap: () => onFilterChanged(CallFilter.missed),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFilter == CallFilter.missed
                        ? Theme.of(context).colorScheme.background
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Missed',
                      style: TextStyle(
                        color: selectedFilter == CallFilter.missed
                            ? activeTextColor
                            : inactiveTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CallListItem extends StatelessWidget {
  final CallHistoryItem call;
  final Color textColor;
  final Color secondaryTextColor;
  final VoidCallback onCallPressed;
  final VoidCallback onVideoCallPressed;
  final VoidCallback onInfoPressed;

  const _CallListItem({
    required this.call,
    required this.textColor,
    required this.secondaryTextColor,
    required this.onCallPressed,
    required this.onVideoCallPressed,
    required this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Avatar and Info
          Expanded(
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(call.avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Call Info
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        call.name,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          // Call Type Icon
                          Icon(
                            _getCallTypeIcon(call.callType),
                            color: _getCallTypeColor(call.callType),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          // Timestamp
                          Text(
                            _getCallTypeText(call.callType),
                            style: TextStyle(
                              color: _getCallTypeColor(call.callType),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Text(
                        call.timestamp,
                        style: TextStyle(
                          color: _getCallTypeColor(call.callType),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Action Buttons
          Row(
            children: [
              // Video Call Button
              IconButton(
                onPressed: onVideoCallPressed,
                icon: Icon(
                  Icons.videocam,
                  color: call.isVideoCall
                      ? const Color(0xFF04aeae)
                      : secondaryTextColor,
                  size: 24,
                ),
              ),
              // Call Button
              IconButton(
                onPressed: onCallPressed,
                icon: Icon(
                  Icons.call,
                  color: secondaryTextColor,
                  size: 24,
                ),
              ),
              // Info Button
              IconButton(
                onPressed: onInfoPressed,
                icon: Icon(
                  Icons.info_outline,
                  color: secondaryTextColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getCallTypeIcon(CallType type) {
    switch (type) {
      case CallType.missed:
        return Icons.call_missed;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.incoming:
        return Icons.call_received;
    }
  }

  Color _getCallTypeColor(CallType type) {
    switch (type) {
      case CallType.missed:
        return Colors.red;
      case CallType.outgoing:
      case CallType.incoming:
        return secondaryTextColor;
    }
  }

  String _getCallTypeText(CallType type) {
    switch (type) {
      case CallType.missed:
        return 'Missed';
      case CallType.outgoing:
        return 'Outgoing';
      case CallType.incoming:
        return 'Incoming';
    }
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.grey[300]! : Colors.grey[800]!;
    final Color secondaryTextColor = isDark ? Colors.grey[400]! : Colors.grey[500]!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.call_end,
              color: secondaryTextColor,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No Recent Calls',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your call history is empty. Calls you make and receive will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryTextColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}