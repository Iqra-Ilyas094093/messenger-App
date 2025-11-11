import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Details Screen',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13ECDA),
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
          seedColor: const Color(0xFF13ECDA),
          brightness: Brightness.dark,
          background: const Color(0xFF102220),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Spline Sans'),
          bodyMedium: TextStyle(fontFamily: 'Spline Sans'),
          titleLarge: TextStyle(fontFamily: 'Spline Sans'),
        ),
      ),
      home: const GroupDetailsScreen(),
    );
  }
}

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF13ECDA);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF102220) : const Color(0xFFF6F8F8),
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            backgroundColor: isDark ? const Color(0xFF102220) : const Color(0xFFF6F8F8),
            elevation: 0,
            pinned: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
              ),
            ),
            title: const Text(
              'Group Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                ),
              ),
            ],
          ),

          // Content
          SliverList(
            delegate: SliverChildListDelegate([
              // Profile Header
              _buildProfileHeader(),

              // Actions Bar
              _buildActionsBar(primaryColor),

              // Divider
              const Divider(height: 1),

              // Shared Media Section
              _buildSharedMediaSection(context),

              // Divider
              const Divider(height: 1),

              // Member List Section
              _buildMemberListSection(),

              // Divider
              const Divider(height: 1),

              // Management Options
              _buildManagementOptions(),

              // Divider
              const Divider(height: 1),

              // Destructive Actions
              _buildDestructiveActions(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuA1sBzD_CfzJJGg7G0yoqtAzozEIv5noYhI2N1DDgd0FsTT2oduvbQ2wTjz3950P6I6M_V0fm9S9N-QsBkSFJREYXVykyHEa80nBtYckT373b3vXQsXFOOHwjSD06N9z_fweqvgAidva8vcORzd2qd-z3r6Wk6SKwZxAfjGuknoNeiIzAuWRqa93dhkv0ghekzbiJpGm_B0peCn69E7wD5gqdPCqUUd-eZJhxTdD4EBnQj4iChGwzRTtltysNZF35_cvOAbhwyYFyTL',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Design Team',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '12 Members',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsBar(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: primaryColor.withOpacity(0.2),
                    shape: const CircleBorder(),
                  ),
                  icon: Icon(
                    Icons.person_add,
                    color: primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: primaryColor.withOpacity(0.2),
                    shape: const CircleBorder(),
                  ),
                  icon: Icon(
                    Icons.notifications_off,
                    color: primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Mute',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: primaryColor.withOpacity(0.2),
                    shape: const CircleBorder(),
                  ),
                  icon: Icon(
                    Icons.search,
                    color: primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharedMediaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shared Media',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: const Color(0xFF13ECDA),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCKEnSiY18TYMxJK4iOjzGoxXPses9ghrWuH002DvfOmJjWNc34FRBh-mRQ-aAT8Mm6JbTCKz-LaXvyTz5Zho2KkMp-ZiTuHGMnahujHK-KaBcAHuxyqPGG6qPa90PAnbG1wgvsloUXKuJuUqqO15tle7nmCZSOpVkK6ZgLWFO7IeOMWs8FVfPpJ8vgTws2fvaGAd8pqriwzYetv5cU32rlDIDa9MpzDq9BCKTt16fMMg1hyZULho1CCDFXGIo-fD2LacablHKlppZM',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAtM60B2u8ZanHMrVSzSpzsWjkEEAoVxX8E3gwRwufvY1qCtlmJ51Vue_PHfO0_wQrf3GkSZiYFHXM4IGaPn0W-R2si3q9iptFkau1m2psz1nOvlh3aClHMc9htjJxvQ_k8NN12k9WWE79XgNcWp46-rGD6Ja7YBC_G4WiH-RjGbfz3tUT92uxXrqhqFejXFe58iYx7kFWNvL9flz0RBZFXJs7tP7xzLzv6deW6fsbnlBq2aeGHSJoeA-UCvJz-QcNoXPgt5yPm8iPT',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDG1PA_M1I_gfUB1CQE1EKcD5RntRVAZeh21wNnNVauWtkgfL9B8NtuFMc_u--Wf1d_wfr2G2vb8TEZnh0QEa5IKPT0my8Tq7ElaBYgfAjKNJhmtMHU2VcTAe5kTATA4IqHVDp3m-sIZnpqAKsBNJFInd0QIZUeEYuZLt6dEXtnFdE7s_3wuksRoQ_1cWh6Ze4PzXVFxAnNIXSGWU_3gPojA2W9-AcRp2UmXVZGqJrCK4rTtbDA55L5zBShEMNA27kpdDX_3gJH3T32',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                child: const Center(
                  child: Text(
                    '+12',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemberListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Members (12)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildMemberItem(
          'Maya Patel',
          'Admin',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDl2HSmnNPdlg70sDgmw265rMtCv4etP71s9iTz4gwBf3Q2xqUjSY1JHS_UblEjzTtY0m_GqAnttKhketpxO7JRad7l4OdESe2-9ZTArEyEYULy0d7pfmR0Hf5iTndSSkodAHXBWJ4jwyd-en2-q9kzM_aVdvYPNqL_saYMZXTTor9DhlV9ubaPhc3yvWWUBokXrSecLRt2l5-ZYj8NFiI_ytgyygqurpbiHH06IwsZqZP2N5QImVuGKOycCLo-nmAngwSeTXCKWOs9',
          isAdmin: true,
        ),
        _buildMemberItem(
          'Liam Chen',
          'UX Designer',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAIEZmxZoiv405jeo0CymGjyz6zKJja4g9Ya7Hyzm-TmmxsQiKzJ4kavf73hafscI5px88yNns50jop8Hpz9gF3HnnFD5JVpouMYx72oYoCMs1DpbeRNhPACn3MVjwEJny3IUqwvZM4lywwut-U4Fy1Pbkf5VLWxnCrFcsR7AK2T0qhIEQyFX0RcAMrt7sPNrZ0QcI3CG9W2hjrzgKbyaWkhb_UgOc8W9tu1qQMwgVrIo7mZ-teWKAt7k5dlG0BcLgxYjPJbiy7NK5a',
        ),
        _buildMemberItem(
          'Chloe Davis',
          'Product Manager',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDH-adb7dgOOrtkL6sJXZhuXwkEe5XkupPfTBnPudrKIs3VaFUafrO3FnMt51wnTXrcwY-ra1CT53_IZun68eKPKotDbfEIOhwKmdfhVPM_gaLKFk1hFwbX4aUfZCo2P-FEzWmZit_aYWtdWmYXt3RmNbAOmBzknPR5REeLd7PbHsdMCOETdUKkTLsOHFwfa8A1P-I1c1dYQ8-6FRqF-UahCux7hxLKu3cTrXzv46hpajmVDZyxQVrH45Vs4hyr6ZUSnDcvWuG5a2F4',
        ),
        _buildMemberItem(
          'Noah Kim',
          'Frontend Developer',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA8SNlKcHtKZX-3IOewAVg6NfKvvYRxwUd0D-Z6s6nE_eu3EG2mBG-C2Z6ZJX6NhmaVlk7ZF88AL900b-danPVAUMM-4eqcz-yfrj3yfzQt5DD6BFrPmmTNvArpjtlAleZa2cu6xDn98JTzgTXZD01ztHGXW4YLgP6U53OllOmsI57sAZCp8gLCVnWnNA4F5loDzzAjsMwepsWSNPqcHQ0XtPFIybjTuG889mdQjbx3lyCCJRMpk3ttY8MfNLe4dvV-V8_vkslbjR5C',
        ),
      ],
    );
  }

  Widget _buildMemberItem(String name, String role, String imageUrl, {bool isAdmin = false}) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        role,
        style: TextStyle(
          color: isAdmin ? const Color(0xFF13ECDA) : Colors.grey[600],
          fontSize: 14,
        ),
      ),
      trailing: isAdmin
          ? IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
      )
          : null,
    );
  }

  Widget _buildManagementOptions() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.edit,
            color: Color(0xFF13ECDA),
            size: 28,
          ),
          title: const Text('Edit Group Info'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.notifications,
            color: Color(0xFF13ECDA),
            size: 28,
          ),
          title: const Text('Notification Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildDestructiveActions() {
    return ListTile(
      leading: const Icon(
        Icons.logout,
        color: Colors.red,
        size: 28,
      ),
      title: const Text(
        'Leave Group',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {},
    );
  }
}