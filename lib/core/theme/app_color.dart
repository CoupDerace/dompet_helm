import 'package:flutter/material.dart';

class AppColors{
  // Primary Amber (Premium)
  static const Color primary = Color(0xFFF59E0B); // Golden Amber
  static const Color primaryLight = Color(0xFFFBBF24); // Soft Amber
  static const Color primaryDark = Color(0xFFD97706); // Deep Amber
  static const Color primarySurface = Color(0xFF452703); // Subtle Amber glow for dark mode
  static const Color primaryBorder = Color(0xFF78350F); // Dark Amber border

  // Semantic
  static const Color green = Color(0xFF16A571);
  static const Color greenSurface = Color(0xFFE8F8F2);
  static const Color amber = Color(0xFFFFBF00); // Amber (Accent)
  static const Color amberSurface = Color(0xFFFDF3E3);
  static const Color red = Color(0xFFE5484D);
  static const Color redSurface = Color(0xFF421C1D);
  static const Color violet = Color(0xFF7A5AF8);
  static const Color violetSurface = Color(0xFF241C42);

  // Neutral (Refined Dark Mode)
  static const Color ink = Color(0xFFFFFFFF); // Pure White for sharp readability
  static const Color slate600 = Color(0xFFE2E8F0); // Very clear secondary text
  static const Color slate500 = Color(0xFFCBD5E1); // Clear muted text
  static const Color slate400 = Color(0xFF94A3B8); // Standard secondary text
  static const Color slate300 = Color(0xFF64748B); // Dim text
  static const Color line = Color(0xFF27272A); // Subtle border
  static const Color line2 = Color(0xFF1F1F22); // Very subtle separator
  static const Color bg = Color(0xFF09090B); // Very dark gray/zinc
  static const Color white = Color(0xFF18181B); // Dark gray surface

  // Dark Mode Colors
  static const Color darkBackground  = Color(0xFF09090B); // latar halaman
  static const Color darkSurface     = Color(0xFF18181B); // AppBar, bottom nav
  static const Color darkSurfaceCard = Color(0xFF27272A); // kartu, input field
  static const Color darkTextPrimary   = Color(0xFFF3F4F6);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkTextHint      = Color(0xFF52525B);
  static const Color darkDivider = Color(0xFF27272A);
  static const Color darkBorder  = Color(0xFF3F3F46);

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
      color: Color(0x52FFBF00),
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