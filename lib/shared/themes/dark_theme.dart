import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(22, 36, 69, 100),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData().copyWith(color: Colors.white),
    textTheme: GoogleFonts.aBeeZeeTextTheme()
        .apply(bodyColor: Colors.white, displayColor: Colors.white));
