import 'package:flutter/material.dart';
import 'package:week_1/screens/screen1.dart';
import 'package:week_1/screens/screen2.dart';
import 'package:week_1/screens/screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen3(), // Select screens 1-6
    );
  }
}