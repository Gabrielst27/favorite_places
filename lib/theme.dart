import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  surface: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.onSurface,
    foregroundColor: darkColorScheme.surfaceBright,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.primaryContainer,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: darkColorScheme.primary),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: darkColorScheme.primaryContainer),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(darkColorScheme.primary),
      foregroundColor: WidgetStateProperty.all(darkColorScheme.onPrimary),
      textStyle: WidgetStateProperty.all(
        GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(
        darkColorScheme.primaryContainer,
      ),
      iconColor: WidgetStateProperty.all(darkColorScheme.primary),
    ),
  ),
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    bodyLarge: GoogleFonts.ubuntuCondensed(
      fontSize: 24,
      color: darkColorScheme.primaryContainer,
    ),
    bodyMedium: GoogleFonts.ubuntuCondensed(
      fontSize: 20,
      color: darkColorScheme.primaryContainer,
    ),
    bodySmall: GoogleFonts.ubuntuCondensed(
      fontSize: 16,
      color: darkColorScheme.primaryContainer,
    ),
    displayLarge: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    displayMedium: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    displaySmall: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    headlineLarge: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    headlineMedium: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    headlineSmall: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    labelMedium: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
    labelSmall: GoogleFonts.ubuntuCondensed(
      color: darkColorScheme.surfaceBright,
    ),
  ),
);
