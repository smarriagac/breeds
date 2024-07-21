import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';

ThemeData getTheme(bool darkMode) {
  if (darkMode) {
    final darkTheme = ThemeData.dark(useMaterial3: true);
    final textTheme = darkTheme.textTheme;
    // const textStyleColor = TextStyle(color: Colors.white);
    const whiteStyle = TextStyle(color: Colors.white);
    const boldStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    return darkTheme.copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      scaffoldBackgroundColor: darkColorScheme.surface,
      colorScheme: darkColorScheme,
      textTheme: GoogleFonts.nunitoSansTextTheme(
        textTheme.copyWith(
          titleSmall: textTheme.titleSmall?.merge(boldStyle),
          titleMedium: textTheme.titleMedium?.merge(boldStyle),
          titleLarge: textTheme.titleLarge?.merge(boldStyle),
          bodySmall: textTheme.bodySmall?.merge(whiteStyle),
        ),
      ),
    );
  }

  final ligthTheme = ThemeData(useMaterial3: true);
  final textTheme = ligthTheme.textTheme;
  const boldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  const darkStyle = TextStyle(color: Colors.black);

  return ligthTheme.copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: lightColorScheme,
    textTheme: GoogleFonts.nunitoSansTextTheme(
      textTheme.copyWith(
        titleSmall: textTheme.titleSmall?..merge(boldStyle),
        titleMedium: textTheme.titleMedium?.merge(boldStyle),
        titleLarge: textTheme.titleLarge?.merge(boldStyle),
        bodySmall: textTheme.bodyMedium?.merge(darkStyle),
      ),
    ),
  );
}
