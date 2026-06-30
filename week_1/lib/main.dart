import 'package:flutter/material.dart';
import 'package:week_1/screens/screen1.dart';
import 'package:week_1/screens/screen2.dart';
import 'package:week_1/screens/screen3.dart';
import 'package:week_1/screens/screen4.dart';
import 'package:week_1/screens/screen5.dart';
import 'package:week_1/screens/screen_n.dart';
import 'package:week_1/screens/screen6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen6(), // Select screens 1-6 or "Screen_N" for the Netflix one
    );
  }
}