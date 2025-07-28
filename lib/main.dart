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
    return Scaffold(body: Column(children: [Introduction(), Topics()]));
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
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Text(
              "BloomSpace is a mental health platform designed for ANM students. Whether you're facing sleepless nights, clinical anxiety, or emotional burnout, this is a place to read, reflect, write, and connect - without pressure, no judgment.",
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Color.fromARGB(255, 43, 45, 66),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Topic-Based Blog Spaces - r/Insomnia, r/ExamStress, r/HeartSpace & more",
            style: GoogleFonts.notoSansGeorgian(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 16, 35, 63),
            ),
          ),
          Text(
            "Our blog section works likes themed Reddits, where you can find spaces that are focused on a specific mental health topic. Each section is focused on:",
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 43, 45, 66),
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
    return Center();
  }
}
