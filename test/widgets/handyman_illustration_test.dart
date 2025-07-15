import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyhub/widgets/handyman_illustration.dart';
import 'package:handyhub/theme/app_theme.dart';

void main() {
  group('Handyman Illustration Widget Tests', () {
    testWidgets('Handyman illustration displays all elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: HandymanIllustration(),
          ),
        ),
      );

      // Check for main container
      expect(find.byType(Container), findsWidgets);
      
      // Check for main icon
      expect(find.byIcon(Icons.handyman), findsOneWidget);
      
      // Check for title text
      expect(find.text('Expert Handyman'), findsOneWidget);
      
      // Check for tool icons
      expect(find.byIcon(Icons.build), findsOneWidget);
      expect(find.byIcon(Icons.electrical_services), findsOneWidget);
      expect(find.byIcon(Icons.plumbing), findsOneWidget);
      expect(find.byIcon(Icons.home_repair_service), findsOneWidget);
    });

    testWidgets('Handyman illustration has proper styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: HandymanIllustration(),
          ),
        ),
      );

      // Check for gradient container
      final containers = tester.widgetList<Container>(find.byType(Container));
      final gradientContainer = containers.firstWhere(
        (container) => container.decoration is BoxDecoration &&
            (container.decoration as BoxDecoration).gradient != null,
        orElse: () => throw 'No gradient container found',
      );
      
      expect(gradientContainer, isNotNull);
      
      // Check for circular main icon container
      final circularContainers = containers.where(
        (container) => container.decoration is BoxDecoration &&
            (container.decoration as BoxDecoration).shape == BoxShape.circle,
      );
      
      expect(circularContainers.isNotEmpty, true);
    });

    testWidgets('Tool icons are properly arranged', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: HandymanIllustration(),
          ),
        ),
      );

      // Check that tools are arranged in a row
      expect(find.byType(Row), findsOneWidget);
      
      // Check that all tool icons are present
      final toolIcons = [
        Icons.build,
        Icons.electrical_services,
        Icons.plumbing,
        Icons.home_repair_service,
      ];
      
      for (final icon in toolIcons) {
        expect(find.byIcon(icon), findsOneWidget);
      }
    });

    testWidgets('Widget renders without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: HandymanIllustration(),
          ),
        ),
      );

      // Should render without throwing any exceptions
      expect(tester.takeException(), isNull);
    });

    testWidgets('Widget respects theme colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: HandymanIllustration(),
          ),
        ),
      );

      // Check that the widget uses theme-based text styling
      final textWidgets = tester.widgetList<Text>(find.byType(Text));
      expect(textWidgets.isNotEmpty, true);
      
      // The text should have proper styling
      final titleText = textWidgets.firstWhere(
        (text) => text.data == 'Expert Handyman',
      );
      expect(titleText.style, isNotNull);
    });
  });
}
