import 'package:flutter/material.dart';

class AppColors{
  // Primary Red (Crimson)
  static const Color primary = Color(0xFFDC143C);
  static const Color primaryLight = Color(0xFFE34261);
  static const Color primaryDark = Color(0xFFA50F2D);
  static const Color primarySurface = Color(0xFFFDE8EC);
  static const Color primaryBorder = Color(0xFFF7B8C4);

  // Semantic
  static const Color green = Color(0xFF16A571);
  static const Color greenSurface = Color(0xFFE8F8F2);
  static const Color amber = Color(0xFFFFBF00); // Amber (Accent)
  static const Color amberSurface = Color(0xFFFDF3E3);
  static const Color red = Color(0xFFE5484D);
  static const Color redSurface = Color(0xFFFDECED);
  static const Color violet = Color(0xFF7A5AF8);
  static const Color violetSurface = Color(0xFFF0EEFF);

  // Neutral
  static const Color ink = Color(0xFF0E1726);
  static const Color slate600 = Color(0xFF4B5E78);
  static const Color slate500 = Color(0xFF6B7A90);
  static const Color slate400 = Color(0xFF9DABBE);
  static const Color slate300 = Color(0xFFCBD2DD);
  static const Color line = Color(0xFFE8ECF2);
  static const Color line2 = Color(0xFFF3F5F8);
  static const Color bg = Color(0xFFF6F7F9);
  static const Color white = Color(0xFFFFFFFF);

  // Dark Mode Colors
  static const Color darkBackground  = Color(0xFF121212); // latar halaman
  static const Color darkSurface     = Color(0xFF1E1E1E); // AppBar, bottom nav
  static const Color darkSurfaceCard = Color(0xFF2C2C2C); // kartu, input field
  static const Color darkTextPrimary   = Color(0xFFEEEEEE);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  static const Color darkTextHint      = Color(0xFF666666);
  static const Color darkDivider = Color(0xFF3A3A3A);
  static const Color darkBorder  = Color(0xFF3A3A3A);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.55, 1.0],
    colors: [primaryLight, primary, primaryDark],
  );

  // Shadows
  static List<BoxShadow> shadowCard = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 24,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
  ];
  static List<BoxShadow> shadowSoft = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 12,
      spreadRadius: 0,
      offset: Offset(0, 2),
    ),
  ];
  static List<BoxShadow> shadowPrimary = [
    BoxShadow(
      color: Color(0x52DC143C),
      blurRadius: 22,
      spreadRadius: 0,
      offset: Offset(0, 10),
    ),
  ];

  // Tone map for FeatureIcon
  static Map<String, List<Color>> tones = {
    'red': [primarySurface, primary],
    'green': [greenSurface, green],
    'amber': [amberSurface, amber],
    'blue': [Color(0xFFE8F1FD), Color(0xFF0B63E5)],
    'violet': [violetSurface, violet],
    'slate': [bg, slate600],
  };

  static List<Color> tone(String name) => tones[name] ?? tones['red']!;
}