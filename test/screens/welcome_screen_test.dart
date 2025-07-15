import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/screens/welcome_screen.dart';
import 'package:handyhub/theme/app_theme.dart';

void main() {
  group('Welcome Screen Tests', () {
    testWidgets('Welcome screen displays all required elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const WelcomeScreen(),
        ),
      );

      // Check for main title
      expect(find.text('Ready to Fix Your Home with HandyHub'), findsOneWidget);
      
      // Check for description text
      expect(find.textContaining('Connect with skilled professionals'), findsOneWidget);
      
      // Check for buttons
      expect(find.text('Get Started'), findsOneWidget);
      expect(find.text('Already have an account? Log in'), findsOneWidget);
      
      // Check for handyman illustration
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('Get Started button is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const WelcomeScreen(),
          routes: {
            '/login': (context) => const Scaffold(body: Text('Login Screen')),
          },
        ),
      );

      // Find and tap the Get Started button
      final getStartedButton = find.text('Get Started');
      expect(getStartedButton, findsOneWidget);
      
      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();
      
      // Should navigate to login screen
      expect(find.text('Login Screen'), findsOneWidget);
    });

    testWidgets('Login link is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const WelcomeScreen(),
          routes: {
            '/login': (context) => const Scaffold(body: Text('Login Screen')),
          },
        ),
      );

      // Find and tap the login link
      final loginLink = find.text('Already have an account? Log in');
      expect(loginLink, findsOneWidget);
      
      await tester.tap(loginLink);
      await tester.pumpAndSettle();
      
      // Should navigate to login screen
      expect(find.text('Login Screen'), findsOneWidget);
    });

    testWidgets('Welcome screen has proper styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const WelcomeScreen(),
        ),
      );

      // Check for gradient background
      final containers = tester.widgetList<Container>(find.byType(Container));
      final gradientContainer = containers.firstWhere(
        (container) => container.decoration is BoxDecoration &&
            (container.decoration as BoxDecoration).gradient != null,
        orElse: () => throw 'No gradient container found',
      );
      
      expect(gradientContainer, isNotNull);
    });
  });
}
