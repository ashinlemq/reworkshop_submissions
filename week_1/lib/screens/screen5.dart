import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen5 extends StatelessWidget {
  const Screen5 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("BingeFlix", style: GoogleFonts.bebasNeue(fontSize: 80),),
      ),
    );
  }
}