import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/theme/app_theme.dart';
import 'package:handyhub/theme/app_colors.dart';

void main() {
  
  group('App Theme Tests', () {
    test('Light theme is properly configured', () {
      final theme = AppTheme.lightTheme;
      
      expect(theme, isNotNull);
      expect(theme.useMaterial3, true);
      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.colorScheme.seedColor, AppColors.primaryBlue);
    });

    test('Text theme uses Poppins font', () {
      final theme = AppTheme.lightTheme;
      
      expect(theme.textTheme, isNotNull);
      // Google Fonts should be applied to text theme
      expect(theme.textTheme.bodyLarge?.fontFamily, contains('Poppins'));
    });

    test('AppBar theme is configured correctly', () {
      final theme = AppTheme.lightTheme;
      final appBarTheme = theme.appBarTheme;
      
      expect(appBarTheme.backgroundColor, Colors.transparent);
      expect(appBarTheme.elevation, 0);
      expect(appBarTheme.iconTheme?.color, Colors.white);
      expect(appBarTheme.titleTextStyle?.color, Colors.white);
      expect(appBarTheme.titleTextStyle?.fontSize, 18);
      expect(appBarTheme.titleTextStyle?.fontWeight, FontWeight.w600);
    });

    test('ElevatedButton theme is configured correctly', () {
      final theme = AppTheme.lightTheme;
      final buttonTheme = theme.elevatedButtonTheme;
      
      expect(buttonTheme.style, isNotNull);
      
      // Test button properties
      final style = buttonTheme.style!;
      expect(style.elevation?.resolve({}), 4);
      expect(style.padding?.resolve({}), const EdgeInsets.symmetric(vertical: 16));
      expect(style.textStyle?.resolve({})?.fontSize, 16);
      expect(style.textStyle?.resolve({})?.fontWeight, FontWeight.w600);
    });

    test('Input decoration theme is configured correctly', () {
      final theme = AppTheme.lightTheme;
      final inputTheme = theme.inputDecorationTheme;
      
      expect(inputTheme.filled, true);
      expect(inputTheme.fillColor, AppColors.lightGray);
      expect(inputTheme.border, isA<OutlineInputBorder>());
      expect(inputTheme.focusedBorder, isA<OutlineInputBorder>());
      expect(inputTheme.contentPadding, 
             const EdgeInsets.symmetric(horizontal: 16, vertical: 16));
    });
  });

  group('App Colors Tests', () {
    test('Primary colors are defined correctly', () {
      expect(AppColors.primaryBlue, const Color(0xFF73D0F5));
      expect(AppColors.secondaryBlue, const Color(0xFF4093B4));
      expect(AppColors.darkBlue, const Color(0xFF337396));
      expect(AppColors.darkestBlue, const Color(0xFF066083));
    });

    test('Orange and yellow colors are defined correctly', () {
      expect(AppColors.primaryOrange, const Color(0xFFFFA93F));
      expect(AppColors.primaryYellow, const Color(0xFFFFCD03));
      expect(AppColors.yellowSecondary, const Color(0xFFFFCA54));
    });

    test('Gray colors are defined correctly', () {
      expect(AppColors.lightBackground, const Color(0xFFFAFAFB));
      expect(AppColors.lightGray, const Color(0xFFEBEEF0));
      expect(AppColors.mediumGray, const Color(0xFFB6B6B6));
      expect(AppColors.textGray, const Color(0xFFA7A7A7));
      expect(AppColors.darkGray, const Color(0xFF808080));
      expect(AppColors.darkerGray, const Color(0xFF575353));
      expect(AppColors.darkestGray, const Color(0xFF343434));
    });

    test('Gradients are defined correctly', () {
      expect(AppColors.blueGradient, isA<LinearGradient>());
      expect(AppColors.orangeGradient, isA<LinearGradient>());
      expect(AppColors.yellowGradient, isA<LinearGradient>());
      
      // Check gradient colors
      expect(AppColors.blueGradient.colors, [
        AppColors.primaryBlue,
        AppColors.secondaryBlue,
      ]);
      
      expect(AppColors.orangeGradient.colors, [
        AppColors.primaryOrange,
        const Color(0xFFFF8C00),
      ]);
      
      expect(AppColors.yellowGradient.colors, [
        AppColors.primaryYellow,
        AppColors.yellowSecondary,
      ]);
    });

    test('Shadow colors have proper opacity', () {
      expect(AppColors.cardShadow.opacity, 0.15);
      expect(AppColors.buttonShadow.opacity, 0.1);
    });

    test('Gradient alignment is correct', () {
      expect(AppColors.blueGradient.begin, Alignment.topLeft);
      expect(AppColors.blueGradient.end, Alignment.bottomRight);
      expect(AppColors.orangeGradient.begin, Alignment.topLeft);
      expect(AppColors.orangeGradient.end, Alignment.bottomRight);
      expect(AppColors.yellowGradient.begin, Alignment.topLeft);
      expect(AppColors.yellowGradient.end, Alignment.bottomRight);
    });
  });
}

extension on ColorScheme {
   get seedColor => null;
}
