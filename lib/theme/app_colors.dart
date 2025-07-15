import 'package:flutter/material.dart';

class AppColors {
  // HandyHub Blue Palette
  static const Color primaryBlue = Color(0xFF73D0F5);
  static const Color secondaryBlue = Color(0xFF4093B4);
  static const Color darkBlue = Color(0xFF337396);
  static const Color darkestBlue = Color(0xFF066083);

  // HandyHub Orange/Yellow Palette  
  static const Color primaryOrange = Color(0xFFFFA93F);
  static const Color primaryYellow = Color(0xFFFFCD03);
  static const Color yellowSecondary = Color(0xFFFFCA54);

  // HandyHub Gray Palette
  static const Color lightBackground = Color(0xFFFAFAFB);
  static const Color lightGray = Color(0xFFEBEEF0);
  static const Color mediumGray = Color(0xFFB6B6B6);
  static const Color textGray = Color(0xFFA7A7A7);
  static const Color darkGray = Color(0xFF808080);
  static const Color darkerGray = Color(0xFF575353);
  static const Color darkestGray = Color(0xFF343434);

  // Gradients
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryBlue, secondaryBlue],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryOrange, Color(0xFFFF8C00)],
  );

  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryYellow, yellowSecondary],
  );

  // Shadow Colors
  static Color cardShadow = primaryBlue.withOpacity(0.15);
  static Color buttonShadow = Colors.black.withOpacity(0.1);
}
