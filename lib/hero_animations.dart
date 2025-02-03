import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void navitageToPage(Widget newScreen) {
    if (Platform.isIOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => SecondScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation Example")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            navitageToPage(SecondScreen());
          },
          child: Hero(
            tag: "hero-tag",
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                  child: Text("Tap Me", style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Transition")),
      body: Center(
        child: Hero(
          tag: "hero-tag",
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
