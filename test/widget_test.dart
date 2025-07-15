import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/main.dart';

void main() {
  group('HandyHub App Tests', () {
    testWidgets('App builds and displays welcome screen', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const HandyHubApp());

      // Verify that the welcome screen is displayed
      expect(find.text('Ready to Fix Your Home with HandyHub'), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
      expect(find.text('Already have an account? Log in'), findsOneWidget);
    });

    testWidgets('Navigation from Welcome to Login works', (WidgetTester tester) async {
      await tester.pumpWidget(const HandyHubApp());

      // Find and tap the "Get Started" button
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Verify navigation to login screen
      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('Log in to HandyHub to continue'), findsOneWidget);
    });

    testWidgets('Navigation from Welcome to Login via link works', (WidgetTester tester) async {
      await tester.pumpWidget(const HandyHubApp());

      // Find and tap the login link
      await tester.tap(find.text('Already have an account? Log in'));
      await tester.pumpAndSettle();

      // Verify navigation to login screen
      expect(find.text('Welcome Back!'), findsOneWidget);
    });

    testWidgets('App theme is properly configured', (WidgetTester tester) async {
      await tester.pumpWidget(const HandyHubApp());

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      
      expect(app.title, 'HandyHub');
      expect(app.debugShowCheckedModeBanner, false);
      expect(app.theme, isNotNull);
    });
  });
}
