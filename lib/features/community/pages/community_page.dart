import 'package:BloomSpace/features/common/widgets/bloom_logo.dart';
import 'package:BloomSpace/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String selectedChannel = 'b/Anxiety';
  String selectedTab = 'Hot';

  void _navigateTo(BuildContext context, String routeName) async {
    if (routeName.startsWith('http://') || routeName.startsWith('https://')) {
      final Uri uri = Uri.parse(routeName);

      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          debugPrint('Could not launch $routeName');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Could not open link')));
        }
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
      return;
    }

    if (ModalRoute.of(context)?.settings.name != routeName) {
      debugPrint('Navigating to: $routeName');
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 247, 247),
      body: Column(
        children: [
          // Top Navigation Bar
          Container(
            color: const Color(0xFFF5F3E8),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    BloomLogo(),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bloom Space',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A3A),
                          ),
                        ),
                        Text(
                          'for TAMU students',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF1E3A3A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 80),
                _buildNavItem(context, 'Home', AppRoutes.home),
                const SizedBox(width: 40),
                _buildNavItem(context, 'Community Space', AppRoutes.community),
                const SizedBox(width: 40),
                _buildNavItem(context, '1-on-1 Chat', AppRoutes.chat1_1),
                const SizedBox(width: 40),
                _buildNavItem(
                  context,
                  'Counseling Services',
                  AppRoutes.counseling,
                ),
                const SizedBox(width: 40),
                _buildNavItem(context, 'Resources', AppRoutes.resources),
                const Spacer(),
                InkWell(
                  onTap: () => _navigateTo(context, '/notifications'),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B9B8F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => _navigateTo(context, AppRoutes.profile),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B9B8F),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade600),
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
                  // Main Content (scrollable as a whole)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Sidebar
                        Container(
                          width: 250,
                          color: const Color.fromARGB(255, 255, 247, 247),
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
                        // Center Content
                        Expanded(
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
            ),
          ),
        ],
      ),
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

  Widget _buildNavItem(BuildContext context, String text, String route) {
    return InkWell(
      onTap: () => _navigateTo(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E3A3A),
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
