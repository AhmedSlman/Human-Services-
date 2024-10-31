import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handyman_provider/splash%20&%20onboarding%20screen/splash_screen.dart';
import 'Widget/Theme/theme_constants.dart';

void main() {
  runApp(
      //enabled: !kReleaseMode,
      AcnooApp());
}

class AcnooApp extends StatelessWidget {
  const AcnooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}

