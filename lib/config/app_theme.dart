import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const colorSeed = Color(0xff9E007E);
const scaffoldBackgroundColor = Color(0xFFF8F7F7);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        primaryColor: colorSeed,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      );
}
