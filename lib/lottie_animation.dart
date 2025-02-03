import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Lottie Animation Example")),
        body: Center(
          child: Lottie.asset("assets/animation.json"),
        ),
      ),
    );
  }
}
