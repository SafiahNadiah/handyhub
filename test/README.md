# HandyHub Flutter App Tests

This directory contains comprehensive unit tests for the HandyHub Flutter application.

## Test Structure

```
test/
├── widget_test.dart                 # Main app widget tests
├── screens/
│   ├── welcome_screen_test.dart     # Welcome/Hero screen tests
│   ├── login_screen_test.dart       # Login screen tests
│   └── home_screen_test.dart        # Home/Dashboard screen tests
├── widgets/
│   ├── handyman_illustration_test.dart    # Handyman illustration widget tests
│   └── social_login_button_test.dart      # Social login button tests
├── theme/
│   └── app_theme_test.dart          # Theme and color tests
├── test_runner.dart                 # Test suite runner
└── README.md                        # This file
```

## Running Tests

### Run All Tests

```bash
flutter test
```

### Run Specific Test File

```bash
flutter test test/screens/welcome_screen_test.dart
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

### Run Test Suite

```bash
flutter test test/test_runner.dart
```

## Test Categories

### 1. Widget Tests (`widget_test.dart`)

- App initialization and setup
- Navigation between screens
- Theme configuration
- Route handling

### 2. Screen Tests

**Welcome Screen (`welcome_screen_test.dart`)**

- UI element rendering
- Button functionality
- Navigation to login
- Styling and layout

**Login Screen (`login_screen_test.dart`)**

- Form validation (email, password)
- Password visibility toggle
- Login form submission
- Social login buttons
- Navigation flows

**Home Screen (`home_screen_test.dart`)**

- Header and user greeting
- Search functionality
- Service categories display
- Recommendations section
- Bottom navigation
- Scroll behavior

### 3. Widget Tests

**Handyman Illustration (`handyman_illustration_test.dart`)**

- Icon and text rendering
- Tool icons arrangement
- Gradient styling
- Theme integration

**Social Login Button (`social_login_button_test.dart`)**

- Button rendering for different providers
- Callback functionality
- Icon display logic
- Styling and layout

### 4. Theme Tests (`app_theme_test.dart`)

- Light theme configuration
- Color definitions and values
- Gradient configurations
- Font integration (Poppins)
- Component theme styling

## Test Coverage

The tests cover:

- ✅ **UI Rendering** - All widgets render correctly
- ✅ **User Interactions** - Buttons, forms, navigation
- ✅ **Form Validation** - Email and password validation
- ✅ **Navigation** - Screen transitions and routing
- ✅ **Styling** - Theme colors, gradients, fonts
- ✅ **State Management** - Form states, loading states
- ✅ **Responsive Design** - Layout and scrolling
- ✅ **Accessibility** - Widget accessibility

## Key Test Features

### Form Validation Tests

- Email format validation
- Password length requirements
- Empty field validation
- Real-time validation feedback

### Navigation Tests

- Welcome → Login navigation
- Login → Home navigation
- Back button functionality
- Route parameter handling

### UI Interaction Tests

- Button press callbacks
- Search input functionality
- Password visibility toggle
- Service category selection

### Theme Integration Tests

- Color scheme validation
- Gradient configuration
- Font family verification
- Component styling

## Running Tests in CI/CD

Add to your CI/CD pipeline:

```yaml
- name: Run Flutter Tests
  run: |
    flutter pub get
    flutter test --coverage
    flutter test --reporter=json > test_results.json
```

## Test Best Practices

1. **Isolate Tests** - Each test is independent
2. **Mock Dependencies** - External dependencies are mocked
3. **Test User Flows** - Complete user journeys are tested
4. **Validate UI State** - UI responds correctly to state changes
5. **Performance** - Tests run quickly and efficiently

## Adding New Tests

When adding new features:

1. Create test file in appropriate directory
2. Follow existing naming conventions
3. Add comprehensive test coverage
4. Update this README if needed
5. Run full test suite to ensure no regressions

## Debugging Tests

```bash
# Run tests in debug mode
flutter test --debug

# Run single test with verbose output
flutter test test/screens/login_screen_test.dart --verbose

# Run tests with coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```
