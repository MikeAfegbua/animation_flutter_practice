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
      home: ScaleAnimationExample(),
    );
  }
}

class ScaleAnimationExample extends StatefulWidget {
  const ScaleAnimationExample({super.key});

  @override
  _ScaleAnimationExampleState createState() => _ScaleAnimationExampleState();
}

class _ScaleAnimationExampleState extends State<ScaleAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.repeat(reverse: true);

    _animation = Tween<double>(begin: 1, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scale Animation Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Scaling",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// abstract class MedicalPractitioner {
//   void diagnose();

//   String get qualification;
//   bool get wearsLabCoat;
// }

// mixin GiveInjection {
//   void giveInjection() {
//     debugPrint("Giving injection...");
//   }
// }

// class DoctorClass with GiveInjection implements MedicalPractitioner {
//   @override
//   void diagnose() {
//     debugPrint("Diagnosing patient...");
//   }

//   @override
//   String get qualification => throw UnimplementedError();

//   @override
//   bool get wearsLabCoat => throw UnimplementedError();
// }

// class NurseClass implements MedicalPractitioner {
//   @override
//   void diagnose() {
//     debugPrint("Diagnosing patient...");
//   }

//   @override
//   String get qualification => "BSN";

//   @override
//   bool get wearsLabCoat => false;
// }

// BASE CLASS IMPLENTATION

// abstract class AnimalClass {
//   void makeSound();
// }

// class DogClass implements AnimalClass {
//   @override
//   void makeSound() {
//     print("Woof!");
//   }
// }

// class CatClass implements AnimalClass {
//   @override
//   void makeSound() {
//     print("Meow!");
//   }
// }

// INHERITANCE IMPLEMENTATION
// class AnimalClass {
//   void giveBirth() {
//     debugPrint("Animal giving birth...");
//   }
// }

// class DogClass extends AnimalClass {}
