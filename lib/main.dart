import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(const CashFixApp());
}

class CashFixApp extends StatelessWidget {
  const CashFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashFix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
