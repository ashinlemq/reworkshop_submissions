import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.black,
      child: SafeArea( // Prevents text content from being obscured by device camera
        child: Align(
          alignment: Alignment.topLeft,
            child: Text(
              'BingeFlix',
              style: TextStyle(
                color: Colors.red,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ),
    );
  }
}