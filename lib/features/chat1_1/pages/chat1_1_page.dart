import 'package:flutter/material.dart';

class Chat1_1Page extends StatelessWidget {
  const Chat1_1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: Column(
        children: [
          // Header
          Container(
            color: const Color(0xFFE8EFE0),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B9D7F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.eco, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Bloom Space',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 48),
                TextButton(
                  onPressed: () {
                    // Navigate to Home page
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Community Space page
                    Navigator.pushNamed(context, '/community');
                  },
                  child: const Text(
                    'Community Space',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to 1-on-1 Chat page (current page)
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: const Text(
                    '1-on-1 Chat',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Services page
                    Navigator.pushNamed(context, '/services');
                  },
                  child: const Text(
                    'Services',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Spacer(),
                const Text('In crisis? Call or text 988 • ANM Counseling'),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left sidebar
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigate to new chat page
                                    Navigator.pushNamed(context, '/new-chat');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6B9D7F),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Start New Chat',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Search conversations',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildFilterChip('All', true),
                                  const SizedBox(width: 8),
                                  _buildFilterChip('Peer', false),
                                  const SizedBox(width: 8),
                                  _buildFilterChip('Counselor', false),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.unfold_more, size: 20),
                                  const SizedBox(width: 4),
                                  const Text('2'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Text(
                                    'AN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.check_circle,
                                          size: 14,
                                          color: Color(0xFF6B9D7F),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Counselor',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.unfold_more, size: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFE8F5E9),
                            child: Icon(Icons.person, color: Color(0xFF6B9D7F)),
                          ),
                          title: const Text('ANM Counselor'),
                          trailing: const Text(
                            'Thu 2:00',
                            style: TextStyle(fontSize: 12),
                          ),
                          onTap: () {
                            // Navigate to this conversation
                          },
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: InkWell(
                            onTap: () {
                              // Navigate back to dashboard
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.arrow_back_ios, size: 16),
                                SizedBox(width: 8),
                                Text('Back to Dashboard'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Center chat area
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Chat header
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '1-on-1 Chat',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            // Navigate to peer chat page
                                            Navigator.pushNamed(
                                              context,
                                              '/peer-chat',
                                            );
                                          },
                                          child: const Text('Start Peer Chat'),
                                        ),
                                        const SizedBox(width: 12),
                                        OutlinedButton(
                                          onPressed: () {
                                            // Navigate to counselor chat page
                                            Navigator.pushNamed(
                                              context,
                                              '/counselor-chat',
                                            );
                                          },
                                          child: const Text(
                                            'Start Counselor Chat',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Online: 3 listeners • 1 counselor',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          // Chat participant info
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFFE8F5E9),
                                      child: Icon(
                                        Icons.person,
                                        color: Color(0xFF6B9D7F),
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
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Peer Listener',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: const Text(
                                            'Anonymous',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 8,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Online',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.volume_off),
                                  onPressed: () {
                                    // Mute functionality
                                  },
                                ),
                                const Text('Mute'),
                                const SizedBox(width: 16),
                                TextButton(
                                  onPressed: () {
                                    // Block functionality
                                  },
                                  child: const Text('Block'),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          // Messages
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(24),
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text('Glad you reached out.'),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Color(0xFFE8F5E9),
                                        child: Icon(
                                          Icons.person,
                                          color: Color(0xFF6B9D7F),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Text(
                                          'Feeling overwhelmed can be really tough.\nYou don\'t have to go through this alone.',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Thank you for listening.',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        // Navigate to breathing exercise
                                        Navigator.pushNamed(
                                          context,
                                          '/breathing-exercise',
                                        );
                                      },
                                      icon: const Icon(Icons.air),
                                      label: const Text('Breathing exercise'),
                                    ),
                                    const SizedBox(width: 12),
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        // Navigate to grounding steps
                                        Navigator.pushNamed(
                                          context,
                                          '/grounding-steps',
                                        );
                                      },
                                      icon: const Icon(Icons.self_improvement),
                                      label: const Text('Grounding steps'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Input area
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border(
                                top: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Please avoid sharing personal identifiers.\nAnonymous mode is on by default',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Share Resource use',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.emoji_emotions_outlined,
                                      ),
                                      onPressed: () {
                                        // Show emoji picker
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Send message
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF6B9D7F,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Send',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Right sidebar
                  Container(
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to booking page
                              Navigator.pushNamed(context, '/book-session');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6B9D7F),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Book a Session',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Helpful resources',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            // Navigate to ANM article
                            Navigator.pushNamed(context, '/anm-article');
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.play_circle_outline,
                                color: Color(0xFF6B9D7F),
                              ),
                              SizedBox(width: 8),
                              Text('ANM article'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            // Navigate to campus link
                            Navigator.pushNamed(context, '/campus-link');
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.link, color: Color(0xFF6B9D7F)),
                              SizedBox(width: 8),
                              Text('Campus link'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Private notes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Session summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            // Save transcript functionality
                          },
                          child: const Text('Save Transcript'),
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

  Widget _buildFilterChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.grey[300] : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: selected ? Colors.black : Colors.grey[600],
        ),
      ),
    );
  }
}
