# HandyHub Flutter Android App

A Flutter mobile app for HandyHub - Connect with skilled professionals for home repair and maintenance.

## Features

- Welcome/Hero screen with HandyHub branding
- Login screen with email/password and social authentication
- Home dashboard with service categories and recommendations
- Beautiful HandyHub color scheme and gradients

## Building the APK

### Prerequisites

1. Install Flutter SDK: [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Install Android Studio with Android SDK
3. Set up Android emulator or connect physical device

### Build Steps

1. **Get dependencies:**

   ```bash
   flutter pub get
   ```

2. **Build debug APK:**

   ```bash
   flutter build apk --debug
   ```

3. **Build release APK:**

   ```bash
   flutter build apk --release
   ```

4. **Install on device:**
   ```bash
   flutter install
   ```

### APK Location

- Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- Release APK: `build/app/outputs/flutter-apk/app-release.apk`

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── theme/
│   ├── app_colors.dart         # HandyHub brand colors
│   └── app_theme.dart          # App theme configuration
├── screens/
│   ├── welcome_screen.dart     # Hero/landing page
│   ├── login_screen.dart       # Login with social auth
│   └── home_screen.dart        # Dashboard with services
└── widgets/
    ├── handyman_illustration.dart
    ├── social_login_button.dart
    ├── service_category_card.dart
    ├── recommendation_card.dart
    └── promotional_banner.dart
```

## Running the App

```bash
flutter run
```

## HandyHub Brand Colors

- Primary Blue: #73D0F5
- Secondary Blue: #4093B4
- Orange: #FFA93F
- Yellow: #FFCD03
