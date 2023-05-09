import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  Color color = Colors.red;
  double height = 50;
  double weight = 100;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: weight,
          height: height,
          duration: const Duration(seconds: 1),
          curve: Curves.elasticOut,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            weight = random.nextInt(300).toDouble();
            height = random.nextInt(300).toDouble();
            color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
