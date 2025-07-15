import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/screens/home_screen.dart';
import 'package:handyhub/theme/app_theme.dart';

void main() {
  group('Home Screen Tests', () {
    testWidgets('Home screen displays all required elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check for header elements
      expect(find.text('Good Morning,'), findsOneWidget);
      expect(find.text('Sarah Johnson'), findsOneWidget);
      
      // Check for search bar
      expect(find.text('What service do you need?'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      
      // Check for promotional banner
      expect(find.text('Special Offer'), findsOneWidget);
      expect(find.text('Get 20% off your first booking with code FIRST20'), findsOneWidget);
      
      // Check for service categories section
      expect(find.text('Our Services'), findsOneWidget);
      
      // Check for service categories
      expect(find.text('Electrical'), findsOneWidget);
      expect(find.text('Plumbing'), findsOneWidget);
      expect(find.text('Air Conditioning'), findsOneWidget);
      expect(find.text('Installations'), findsOneWidget);
      
      // Check for recommendations section
      expect(find.text('Recommended for You'), findsOneWidget);
      expect(find.text('See All'), findsOneWidget);
    });

    testWidgets('Service categories are displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check that service category cards are present
      expect(find.byType(GridView), findsOneWidget);
      
      // Check for all service categories
      final serviceCategories = ['Electrical', 'Plumbing', 'Air Conditioning', 'Installations'];
      for (final category in serviceCategories) {
        expect(find.text(category), findsOneWidget);
      }
    });

    testWidgets('Recommendations are displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check for recommendation cards
      expect(find.text('Home Electrical Inspection'), findsOneWidget);
      expect(find.text('Kitchen Faucet Repair'), findsOneWidget);
      expect(find.text('AC Unit Maintenance'), findsOneWidget);
      
      // Check for provider names
      expect(find.text('ElectricPro Services'), findsOneWidget);
      expect(find.text('PlumbMaster Solutions'), findsOneWidget);
      expect(find.text('CoolAir Specialists'), findsOneWidget);
      
      // Check for ratings and prices
      expect(find.text('4.8'), findsOneWidget);
      expect(find.text('4.9'), findsOneWidget);
      expect(find.text('4.7'), findsOneWidget);
      expect(find.text('\$85'), findsOneWidget);
      expect(find.text('\$65'), findsOneWidget);
      expect(find.text('\$120'), findsOneWidget);
    });

    testWidgets('Search functionality works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Find search field
      final searchField = find.byType(TextField);
      expect(searchField, findsOneWidget);
      
      // Enter search query
      await tester.enterText(searchField, 'electrical');
      await tester.pump();
      
      // Verify text was entered
      expect(find.text('electrical'), findsOneWidget);
    });

    testWidgets('Bottom navigation bar is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check for bottom navigation bar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      
      // Check for navigation items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Bookings'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Promotional banner displays correct information', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check promotional banner content
      expect(find.text('🎉 Special Offer'), findsOneWidget);
      expect(find.text('Get 20% off your first booking with code FIRST20'), findsOneWidget);
      expect(find.text('FIRST20'), findsOneWidget);
    });

    testWidgets('User profile section displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check user greeting
      expect(find.text('Good Morning,'), findsOneWidget);
      expect(find.text('Sarah Johnson'), findsOneWidget);
      
      // Check for profile avatar
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('Scroll functionality works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      );

      // Check that the screen is scrollable
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      
      // Verify initial content is visible
      expect(find.text('Good Morning,'), findsOneWidget);
      
      // Scroll down
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pump();
      
      // Content should still be accessible
      expect(find.text('Our Services'), findsOneWidget);
    });
  });
}
