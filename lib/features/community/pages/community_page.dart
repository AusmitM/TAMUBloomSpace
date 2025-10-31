import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String selectedChannel = 'b/Anxiety';
  String selectedTab = 'Hot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF5A9B8A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.eco_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Bloom Space',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          _buildNavButton('Home', '/home'),
          _buildNavButton('Community Space', '/community', isActive: true),
          _buildNavButton('1-on-1 Chat', '/chat'),
          _buildNavButton('Counseling Services', '/counseling'),
          _buildNavButton('Resources', '/resources'),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF5A9B8A),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const Text(
                  'Community Space',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A7C6E),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Join discussions on various mental health topics',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search posts',
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/browse-channels');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A9B8A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(0, 50),
                      ),
                      child: const Text(
                        'Browse Channels',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Sidebar
                Container(
                  width: 250,
                  color: Colors.grey.shade50,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Channels',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildChannelItem('b/Anxiety'),
                          _buildChannelItem('b/SelfCare'),
                          _buildChannelItem('b/AcademicStress'),
                          _buildChannelItem('b/Mindfulness'),
                          _buildChannelItem('b/Relationships'),
                          _buildChannelItem('b/FirstYear'),
                          const SizedBox(height: 24),
                          const Text(
                            'Saved',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'My Posts',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Center Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _buildFeedTab('Hot'),
                              const SizedBox(width: 32),
                              _buildFeedTab('New'),
                              const SizedBox(width: 32),
                              _buildFeedTab('Top'),
                              const SizedBox(width: 32),
                              _buildFeedTab('Search'),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.tune,
                                  color: Colors.grey.shade700,
                                ),
                                onPressed: () {
                                  // Open filter menu
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildPost(
                            title: 'Tips for Managing Study Stress',
                            content:
                                'I wanted to share some techniques that have helped me stay calm during exam season. Breaking tasks into smaller chunks really helps.',
                            upvotes: 45,
                            comments: 12,
                          ),
                          const SizedBox(height: 16),
                          _buildPost(
                            title: 'Finding Balance in College Life',
                            content:
                                'College can be overwhelming with academics, social life, and self-care. How do you all find balance?',
                            upvotes: 32,
                            comments: 6,
                          ),
                          const SizedBox(height: 16),
                          _buildPost(
                            title: 'Recommended Mental Health Resources',
                            content:
                                'Does anyone have recommendations for helpful apps or websites? Looking for some new tools.',
                            upvotes: 24,
                            comments: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Right Sidebar
                Container(
                  width: 280,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/community-guidelines',
                            );
                          },
                          child: const Text(
                            'Community Guidelines',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Crisis support: Call 988',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Upcoming Events',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Mental Health Workshop',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'May 50',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/community-info');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Community',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          // Call crisis support
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Crisis support:\nCall 988',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/upcoming-events');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Upcoming Events',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Mental Health Workshop',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
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
      ),
    );
  }

  Widget _buildNavButton(String label, String route, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        if (isActive)
          Container(
            height: 3,
            width: label.length * 8.0,
            color: const Color(0xFF5A9B8A),
          ),
      ],
    );
  }

  Widget _buildChannelItem(String name) {
    bool isActive = selectedChannel == name;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedChannel = name;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF5A9B8A) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedTab(String label) {
    bool isActive = selectedTab == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          if (isActive)
            Container(height: 2, width: 40, color: const Color(0xFF5A9B8A)),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String title,
    required String content,
    required int upvotes,
    required int comments,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/post-detail');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.arrow_upward, size: 20, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  upvotes.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.chat_bubble_outline,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  comments.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.bookmark_border,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  'Comments',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const Spacer(),
                Icon(
                  Icons.analytics_outlined,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  'Analytics',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.bookmark_border,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  'Save',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
