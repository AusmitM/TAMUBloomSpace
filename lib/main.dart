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
    return Scaffold(body: Column(children: [Introduction()]));
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
          Text(
            "Welcome to BloomSpace - Your Safe Space to Breate and Be Heard",
            style: GoogleFonts.notoSansGeorgian(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 16, 35, 63),
            ),
          ),
          Text(
            "BloomSpace is a mental health platform designed for ANM students. Whether you're facing sleepless nights, clinical anxiety, or emotional burnout, this is a place to read, reflect, write, and connect - without pressure, no judgment.",
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 43, 45, 66),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Color.fromARGB(0, 22, 60, 94),
                // ),
                onPressed: appState.printButton,
                child: Text('Join the Community'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: appState.printButton,
                child: Text('Explore Posts'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics')),
      body: Center(
        child: Text(
          'Explore various topics related to mental health and well-being.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Features')),
      body: Center(
        child: Text(
          'Discover the features of Bloom Space that help you manage your mental health effectively.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
