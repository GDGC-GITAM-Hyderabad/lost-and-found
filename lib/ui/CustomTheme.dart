import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColorScheme.dart';


final theme = ThemeData.from(colorScheme: customColorScheme).copyWith(
 // useMaterial3: true,
 // scaffoldBackgroundColor: customColorScheme.background,
  colorScheme: customColorScheme,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(

    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),

  ),
);