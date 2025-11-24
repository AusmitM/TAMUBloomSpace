import 'package:BloomSpace/features/common/widgets/bloom_logo.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool hideActivity = true;
  bool showOnlineStatus = false;
  String selectedTab = 'Edit Profile';
  String selectedSidebarItem = 'Edit Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: const Row(
          children: [
            BloomLogo(size: 36),
            SizedBox(width: 12),
            Text(
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
          _buildNavButton('Community Space', '/community'),
          _buildNavButton('1-on-1 Chat', '/chat'),
          _buildNavButton('Counseling Services', '/counseling'),
          _buildNavButton('Resources', '/resources'),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 175,
            color: const Color(0xFFE8F0EE),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFB3D4CC),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Color(0xFF5A9B8A),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Display Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                _buildSidebarItem('Edit Profile'),
                _buildSidebarItem('Saved Posts'),
                _buildSidebarItem('Privacy Settings'),
                _buildSidebarItem('Notification Settings'),
                _buildSidebarItem('Account'),
                _buildSidebarItem('Logout'),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile & Settings',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Tabs
                    Row(
                      children: [
                        _buildTab('Edit Profile'),
                        const SizedBox(width: 48),
                        _buildTab('Privacy & Safety'),
                        const SizedBox(width: 48),
                        _buildTab('Notifications'),
                        const SizedBox(width: 48),
                        _buildTab('Saved Posts'),
                      ],
                    ),
                    const Divider(height: 1, thickness: 1, color: Colors.grey),
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column - Forms
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Account',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Display Name',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Display Name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Bio',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'Privacy & Safety',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Allow 1-on-1 send 1 o-1 messages:',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    width: 250,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: DropdownButton<String>(
                                      value: 'Everyone',
                                      isExpanded: true,
                                      underline: Container(),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
                                      items:
                                          ['Everyone', 'Friends Only', 'No One']
                                              .map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              )
                                              .toList(),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFFB3D4CC),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Color(0xFF5A9B8A),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/change-profile-picture',
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF5A9B8A),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Hide my activity',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Switch(
                                    value: hideActivity,
                                    onChanged: (value) {
                                      setState(() {
                                        hideActivity = value;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor: const Color(0xFF5A9B8A),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Show my online status',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Switch(
                                    value: showOnlineStatus,
                                    onChanged: (value) {
                                      setState(() {
                                        showOnlineStatus = value;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor: const Color(0xFF5A9B8A),
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/data-privacy');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Data privacy',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: Colors.grey.shade700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.eco_outlined,
                                      color: const Color(0xFF7AB5A3),
                                      size: 28,
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      'In a crisis? Call or text 988',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 60),
                        // Right Column - Saved Posts
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Saved Posts',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildSavedPost(),
                              const SizedBox(height: 20),
                              _buildSavedPost(),
                              const SizedBox(height: 40),
                              const Text(
                                'Saved Posts',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildSavedPost(),
                              const SizedBox(height: 20),
                              _buildSavedPost(),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildNavButton(String label, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildSidebarItem(String label) {
    bool isActive = selectedSidebarItem == label;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedSidebarItem = label;
            });
            switch (label) {
              case 'Edit Profile':
                break;
              case 'Saved Posts':
                Navigator.pushNamed(context, '/saved-posts');
                break;
              case 'Privacy Settings':
                Navigator.pushNamed(context, '/privacy-settings');
                break;
              case 'Notification Settings':
                Navigator.pushNamed(context, '/notification-settings');
                break;
              case 'Account':
                Navigator.pushNamed(context, '/account');
                break;
              case 'Logout':
                Navigator.pushNamed(context, '/logout');
                break;
            }
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF5A9B8A) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label) {
    bool isActive = label == selectedTab;
    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
        switch (label) {
          case 'Privacy & Safety':
            Navigator.pushNamed(context, '/privacy-safety-tab');
            break;
          case 'Notifications':
            Navigator.pushNamed(context, '/notifications-tab');
            break;
          case 'Saved Posts':
            Navigator.pushNamed(context, '/saved-posts-tab');
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
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
            const SizedBox(height: 12),
            if (isActive)
              Container(
                height: 3,
                width: label.length * 8.0,
                color: const Color(0xFF5A9B8A),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedPost() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/saved-post-detail');
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A title of a sa saved post',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              height: 3,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 6),
            Container(
              height: 3,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
