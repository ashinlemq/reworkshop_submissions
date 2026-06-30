import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bingeworthy TV Shows',
          style: GoogleFonts.bebasNeue(fontSize: 30),
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("BingeFlix", style: GoogleFonts.bebasNeue(fontSize: 80)),
      ),
    );
  }
}
