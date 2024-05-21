import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
        Color.fromARGB(255, 33, 5, 109),
        Color.fromARGB(255, 68, 21, 149),
      ),
    ),
  ));
}
