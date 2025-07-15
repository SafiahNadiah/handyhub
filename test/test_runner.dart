import 'package:flutter_test/flutter_test.dart';

// Import all test files
import 'widget_test.dart' as widget_test;
import 'screens/welcome_screen_test.dart' as welcome_test;
import 'screens/login_screen_test.dart' as login_test;
import 'screens/home_screen_test.dart' as home_test;
import 'widgets/handyman_illustration_test.dart' as handyman_test;
import 'widgets/social_login_button_test.dart' as social_button_test;
import 'theme/app_theme_test.dart' as theme_test;

void main() {
  group('HandyHub App Test Suite', () {
    group('Main App Tests', widget_test.main);
    group('Welcome Screen Tests', welcome_test.main);
    group('Login Screen Tests', login_test.main);
    group('Home Screen Tests', home_test.main);
    group('Handyman Illustration Widget Tests', handyman_test.main);
    group('Social Login Button Widget Tests', social_button_test.main);
    group('Theme and Colors Tests', theme_test.main);
  });
}
