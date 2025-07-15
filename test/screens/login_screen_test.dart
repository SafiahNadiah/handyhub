import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/screens/login_screen.dart';
import 'package:handyhub/theme/app_theme.dart';

void main() {
  group('Login Screen Tests', () {
    testWidgets('Login screen displays all required elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      );

      // Check for header elements
      expect(find.text('Log In'), findsOneWidget);
      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('Log in to HandyHub to continue'), findsOneWidget);
      
      // Check for form fields
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      
      // Check for form inputs
      expect(find.byType(TextFormField), findsNWidgets(2));
      
      // Check for buttons
      expect(find.text('Log In'), findsNWidgets(2)); // Header and button
      expect(find.text('Forgot Password?'), findsOneWidget);
      
      // Check for social login buttons
      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.text('Continue with Apple'), findsOneWidget);
      
      // Check for sign up link
      expect(find.text('Sign up'), findsOneWidget);
    });

    testWidgets('Email validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      );

      // Find email field and enter invalid email
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'invalid-email');
      
      // Tap login button to trigger validation
      await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
      await tester.pump();
      
      // Should show validation error
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('Password validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      );

      // Enter valid email but short password
      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).at(1);
      
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, '123');
      
      // Tap login button to trigger validation
      await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
      await tester.pump();
      
      // Should show password validation error
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('Password visibility toggle works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      );

      // Find password field
      final passwordField = find.byType(TextFormField).at(1);
      final TextField passwordTextField = tester.widget(passwordField);
      
      // Initially password should be obscured
      expect(passwordTextField.obscureText, true);
      
      // Find and tap visibility toggle
      final visibilityToggle = find.byIcon(Icons.visibility_off);
      expect(visibilityToggle, findsOneWidget);
      
      await tester.tap(visibilityToggle);
      await tester.pump();
      
      // Password should now be visible
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('Login form submission works with valid data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
          routes: {
            '/home': (context) => const Scaffold(body: Text('Home Screen')),
          },
        ),
      );

      // Enter valid credentials
      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).at(1);
      
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      
      // Tap login button
      await tester.tap(find.widgetWithText(ElevatedButton, 'Log In'));
      await tester.pump();
      
      // Should show loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      
      // Wait for login completion
      await tester.pumpAndSettle(const Duration(seconds: 3));
      
      // Should navigate to home screen
      expect(find.text('Home Screen'), findsOneWidget);
    });

    testWidgets('Back button navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      );

      // Find back button
      final backButton = find.byIcon(Icons.arrow_back_ios_new);
      expect(backButton, findsOneWidget);
      
      // Back button should be tappable
      await tester.tap(backButton);
      await tester.pump();
    });
  });
}
