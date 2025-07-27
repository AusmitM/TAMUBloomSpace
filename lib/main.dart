import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
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
          ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Color.fromARGB(0, 22, 60, 94),
            // ),
            onPressed: appState.printButton,
            child: Text('Join the Community'),
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
