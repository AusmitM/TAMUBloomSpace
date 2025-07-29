import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Bloom Space',
        theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 247),
        ),
        home: HomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  void printButton() {
    print("Button Pressed");
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Introduction(),
          SizedBox(height: 35),
          Topics(),
          SizedBox(height: 35),
          Features(),
        ],
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text(
                "Welcome to BloomSpace - Your Safe Space to Breathe and Be Heard",
                style: GoogleFonts.headlandOne(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 16, 35, 63),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Text(
              "BloomSpace is a mental health platform designed for ANM students. Whether you're facing sleepless nights, clinical anxiety, or emotional burnout, this is a place to read, reflect, write, and connect - without pressure, no judgment.",
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Color.fromARGB(255, 43, 45, 66),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 22, 60, 94),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: appState.printButton,
                  child: Text('Join the Community'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 22, 60, 94),
                      width: 1.5,
                    ),
                    foregroundColor: Color.fromARGB(255, 22, 60, 94),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: appState.printButton,
                  child: Text('Explore Posts'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Text(
              "Topic-Based Blog Spaces - r/Insomnia, r/ExamStress, r/HeartSpace & more",
              style: GoogleFonts.headlandOne(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 35, 63),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Text(
              "Our blog section works likes themed Reddits, where you can find spaces that are focused on a specific mental health topic. Each section is focused on:",
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Color.fromARGB(255, 43, 45, 66),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2022',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Color.fromARGB(255, 43, 45, 66),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 230,
                          child: Text(
                            "Writing is externalized and processes emotions",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2022',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Color.fromARGB(255, 43, 45, 66),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 230,
                          child: Text(
                            "Posts help you find people going through similar experiences",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2022',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Color.fromARGB(255, 43, 45, 66),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 230,
                          child: Text(
                            "Comment sections build connections",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Color.fromARGB(255, 22, 60, 94),
                          width: 1.5,
                        ),
                        foregroundColor: Color.fromARGB(255, 22, 60, 94),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: appState.printButton,
                      child: Text('Explore All Blog Topics'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 12,
                          color: Color.fromARGB(255, 255, 189, 46),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "r/Insomnia",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Color.fromARGB(255, 43, 45, 66),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Color.fromARGB(255, 0, 153, 255),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "r/ExamStress",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Color.fromARGB(255, 255, 82, 82),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "r/HeartSpace",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Color.fromARGB(255, 0, 181, 120),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "r/FromTheField",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Color.fromARGB(255, 229, 148, 0),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "r/Overwhelmed",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: Color.fromARGB(255, 139, 97, 225),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "r/SmallWins",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Featured Posts from the Community             ",
              style: GoogleFonts.headlandOne(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 16, 35, 63),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 290,
                      child: Text(
                        "Sometimes, a private conversation can change your world. BloomSpace connects you with one.",
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Card(
                          elevation: 2, // Optional: for shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ), // Adjust this value for desired roundness
                          ),
                          color: Color.fromARGB(255, 13, 50, 96),
                          child: Container(
                            width: 90,
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "A Private Conversation",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 255, 248, 226),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Sometimes a private conversation can mean the world.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 255, 248, 226),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2, // Optional: for shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ), // Adjust this value for desired roundness
                          ),
                          color: Color.fromARGB(255, 106, 143, 212),
                          child: Container(
                            width: 90,
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Fully Anonymous",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "My BloomSpace connects you with one — anonymously.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2, // Optional: for shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ), // Adjust this value for desired roundness
                          ),
                          color: Color.fromARGB(255, 255, 248, 226),
                          child: Container(
                            width: 90,
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Matched by Topic",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 13, 50, 96),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "If you connect with a post — you can be matched by topic.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 13, 50, 96),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.smiley,
                          size: 18,
                          color: Color.fromARGB(255, 13, 50, 96),
                        ),
                        SizedBox(width: 2),
                        Container(
                          width: 65,
                          child: Text(
                            "Personal mood tracker",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.refresh,
                          size: 18,
                          color: Color.fromARGB(255, 13, 20, 96),
                        ),

                        SizedBox(width: 2),
                        Container(
                          width: 65,
                          child: Text(
                            "Breathing exercises",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 18,
                          color: Color.fromARGB(255, 13, 20, 96),
                        ),
                        SizedBox(width: 2),
                        Container(
                          width: 65,
                          child: Text(
                            "Guided journaling",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Color.fromARGB(255, 43, 45, 66),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
