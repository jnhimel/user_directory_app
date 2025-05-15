import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
