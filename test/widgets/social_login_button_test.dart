import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/widgets/social_login_button.dart';
import 'package:handyhub/theme/app_theme.dart';

void main() {
  group('Social Login Button Widget Tests', () {
    testWidgets('Google login button displays correctly', (WidgetTester tester) async {
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Google',
              iconPath: 'assets/icons/google.png',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      // Check for button text
      expect(find.text('Continue with Google'), findsOneWidget);
      
      // Check for button widget
      expect(find.byType(OutlinedButton), findsOneWidget);
      
      // Check for icon container
      expect(find.byType(Container), findsWidgets);
      
      // Test button press
      await tester.tap(find.byType(OutlinedButton));
      expect(wasPressed, true);
    });

    testWidgets('Apple login button displays correctly', (WidgetTester tester) async {
      bool wasPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Apple',
              iconPath: 'assets/icons/apple.png',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      // Check for button text
      expect(find.text('Continue with Apple'), findsOneWidget);
      
      // Check for button widget
      expect(find.byType(OutlinedButton), findsOneWidget);
      
      // Test button press
      await tester.tap(find.byType(OutlinedButton));
      expect(wasPressed, true);
    });

    testWidgets('Button has proper styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Google',
              iconPath: 'assets/icons/google.png',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Check button styling
      final button = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      expect(button.style, isNotNull);
      
      // Check for proper layout
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Button icon changes based on provider', (WidgetTester tester) async {
      // Test Google icon
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Google',
              iconPath: 'assets/icons/google.png',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Should have Google-style icon
      expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
      
      // Test Apple icon
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Apple',
              iconPath: 'assets/icons/apple.png',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Should have Apple icon
      expect(find.byIcon(Icons.apple), findsOneWidget);
    });

    testWidgets('Button respects full width constraint', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: SocialLoginButton(
                text: 'Continue with Google',
                iconPath: 'assets/icons/google.png',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Check that button takes full width
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, double.infinity);
    });

    testWidgets('Button callback works correctly', (WidgetTester tester) async {
      int pressCount = 0;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialLoginButton(
              text: 'Continue with Google',
              iconPath: 'assets/icons/google.png',
              onPressed: () => pressCount++,
            ),
          ),
        ),
      );

      // Initial state
      expect(pressCount, 0);
      
      // Press button multiple times
      await tester.tap(find.byType(OutlinedButton));
      expect(pressCount, 1);
      
      await tester.tap(find.byType(OutlinedButton));
      expect(pressCount, 2);
    });
  });
}
