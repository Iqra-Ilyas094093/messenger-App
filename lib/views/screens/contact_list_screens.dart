import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String imageUrl;
  final String status;
  final bool isOnline;
  final String statusColor;

  Contact({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.isOnline,
    required this.statusColor,
  });
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> contacts = [
    Contact(
      name: "Aarav Sharma",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCcHavmoL4erNKoPKDxLJiWpn1x6sl-tF-YoKBZB7P-vh0mg-dOglhgNlanGd4GNcYzATyBP8KvrzvK12WjMvhLy8vu_PByZSvR935qdiOrJ4s2dXqnY0hjT3v6aTylhZMmo2ZAhCpgYotVqapYBT6oLm-zJZQ8LOYTl9bmkI-x3b23aFK-DneAwPrfxRFGdiCYAZ4s_Mr6e3e6fZommz18smlmZHRPGERsllinYqdPZkXgKCgaQZwAcNnk45e_CPf8-cajNiR2iQpM",
      status: "Online",
      isOnline: true,
      statusColor: "green",
    ),
    Contact(
      name: "Chloe Garcia",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAsIz-RQe_eTCSyx6blqSu2kxQiRd47I04D0lCfKLPX7BHSK_Zsc2Va0UuPkFPxVHobguEvmBbLBHzeCRJqpfZ-jC9QkFdU4uq7JqHApheNzpqJJYLSvYteLtcK7lmlV7T8Z9XrSJ_MaMzz651xwMX3eL6wQz1yPv0sFUpy3LOcKfstNz-ixQacgqepT5wJVHjG-vLktMHi2iGtj6xzGGHwltay27NawowLLhang57WkLBb8EKs8wsC0xkv5MlClbD-CL5XzYdBXHvM",
      status: "Last seen 2 hours ago",
      isOnline: false,
      statusColor: "zinc",
    ),
    Contact(
      name: "Ethan Nguyen",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCDzZzEeW1WfwCGbxK1IWuCSO3YWDZ-nQ1D2mmfzDOWFses0arXodgeXx8is5NqZWVjwI6cF7nPmykpg6TPph8n3Wf9ceGDgsAbPWOjDF202OvAVtkjjcODHPNfX4-i5-PbCaU7KjKYiV9LizFRDyXuzriWmwePVDbdWDMw00gkCYza5wJFlZg47Az4t5mjvWw31jCnzc-J1ZXoS90KQvW7RfY4s9rEj4tA0r9ev9JCT-u65wCbpmksWHEcDAN2kdfOkomSUpSIxWkU",
      status: "Last seen yesterday",
      isOnline: false,
      statusColor: "zinc",
    ),
    Contact(
      name: "Liam O'Connell",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDp95YJgWHIh3fzP7pFUKnUUrtQMUtTm87E-ZzUyTqNM11rs0hfGrCBGnix-ATQGJN7N8mFfJXZdKngSr1PybEUquCcUZbRXw-lr8oFD7nZ45DlsBdiTCub2czDp8TT8o8mOWD556VG5CjRzbZ_1yLPqvFf81GI1exR7FQl8d2LN6gRnnAQ_S4wFfE-G6Ee70yOwYxI-PekI6Jq3m5y_xBlxBwScoQpJcPPJ5HYFECm4x6PA5CtOKcdBDhSB6G7cYp2KndvUyH_IiNw",
      status: "Online",
      isOnline: true,
      statusColor: "green",
    ),
    Contact(
      name: "Olivia Chen",
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCkja8AY4gVcchuSB9U23ElkgeuQIMSDtFcp8c1jTcYS5wvPgJQ_bYELwvdcrTYTgUmV0ZBC4G5s5zTt1SAHjAfgqxauRt51HVL2gzla9RXWeAGojX_8Tuak5oGc1Cbcg-ZDexNpBF6XxiDfoxKgqS01-ekz53bccIBzGHo24yJb7C5IlRZWOetJw0yNswm5JQObnpvBLeqdm9cHIWZ7Z64cHiW2VnSm9Ju-LWKzcJaRGOCAXFnyAU5wt7M7xbnX2jryp4PPEsSLktU",
      status: "Last seen 5 minutes ago",
      isOnline: false,
      statusColor: "zinc",
    ),
  ];

  final List<String> alphabet = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
    'L', 'M', 'N', 'O', 'P', '...', 'Z'
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
      body: Stack(
        children: [
          Column(
            children: [
              // App Bar
              Container(
                decoration: BoxDecoration(
                  color: (isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8)).withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                          ),
                          const SizedBox(width: 100,),
                          Text(
                            "Contacts",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF27272a) : const Color(0xFFe4e4e7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.search,
                                color: isDark ? const Color(0xFFa1a1aa) : const Color(0xFF71717a),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search by name or number",
                                  hintStyle: TextStyle(
                                    color: isDark ? const Color(0xFFa1a1aa) : const Color(0xFF71717a),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                                ),
                                style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Contacts List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildSection("A", 0),
                    _buildContactItem(contacts[0]),
                    _buildSection("C", 16),
                    _buildContactItem(contacts[1]),
                    _buildSection("E", 16),
                    _buildContactItem(contacts[2]),
                    _buildSection("L", 16),
                    _buildContactItem(contacts[3]),
                    _buildSection("O", 16),
                    _buildContactItem(contacts[4]),
                    const SizedBox(height: 96),
                  ],
                ),
              ),
            ],
          ),
          // Alphabet Sidebar
          Positioned(
            right: 8,
            top: MediaQuery.of(context).size.height / 2,
            // transform: Matrix4.translationValues(0, -100, 0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDark ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: alphabet.map((letter) {
                  final isActive = ['A', 'C', 'E', 'L', 'O'].contains(letter);
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isActive
                              ? const Color(0xFF0d9488)
                              : (isDark ? const Color(0xFFa1a1aa) : const Color(0xFF71717a)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF0d9488),
        child: const Icon(Icons.add_comment, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildSection(String letter, double topMargin) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin, bottom: 8),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0d9488),
        ),
      ),
    );
  }

  Widget _buildContactItem(Contact contact) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {},
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isDark ? const Color(0xFF27272a) : const Color(0xFFe4e4e7),
            ),
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(contact.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (contact.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? const Color(0xFF161022) : const Color(0xFFf6f6f8),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    contact.status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: contact.isOnline
                          ? Colors.green
                          : (isDark ? const Color(0xFFa1a1aa) : const Color(0xFF71717a)),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}