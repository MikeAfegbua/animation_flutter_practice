// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isContainerBig = false; // INITIAL STATE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedContainer Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _isContainerBig ? 200 : 100,
              height: _isContainerBig ? 200 : 100,
              color: _isContainerBig ? Colors.blue : Colors.red,
              alignment: Alignment.center,
              child: Text(
                "RESIZE ME",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isContainerBig = !_isContainerBig;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  "Tap Me",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationDemoWidget extends StatefulWidget {
  const AnimationDemoWidget({super.key});

  @override
  _AnimationDemoWidgetState createState() => _AnimationDemoWidgetState();
}

class _AnimationDemoWidgetState extends State<AnimationDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: const FlutterLogo(size: 200),
      ),
    );
  }
}
