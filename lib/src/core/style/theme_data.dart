import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

ThemeData themeData = ThemeData(
  primaryColor: ink,
  disabledColor: lightBlueGrey,
  fontFamily: 'Lexend Deca',
  textTheme: TextTheme(
      button: GoogleFonts.lexendDeca(
        color: lime,
      ),
      //Headers
      headline1: GoogleFonts.lexendDeca(
          color: corp,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(fontFamily: 'Lexend Deca')),
      // Form
      headline2: GoogleFonts.lexendDeca(
          fontSize: 12,
          color: Colors.blueGrey,
          textStyle: const TextStyle(fontFamily: 'Lexend Deca')),
      headline3: GoogleFonts.lexendDeca(
          color: inkDark,
          fontSize: 14,
          textStyle: const TextStyle(fontFamily: 'Lexend Deca')),
      //Buttons
      headline4: GoogleFonts.lexendDeca(
          color: corp,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.5,
          textStyle: const TextStyle(fontFamily: 'Lexend Deca'))),
);
