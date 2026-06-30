import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen_N extends StatelessWidget {
  const Screen_N ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Netflix", style: GoogleFonts.bebasNeue(fontSize: 80, color: Colors.red),),
      ),
    );
  }
}