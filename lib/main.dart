import 'package:flutter/material.dart';
import 'package:my_note/screen/splash_screen.dart';
import 'package:my_note/theme/app_theme.dart';


void main() {
  runApp(DiAnnaApp());
}

class DiAnnaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'My note App',
  theme: AppTheme.lightTheme,
  themeMode: ThemeMode.light,     // atau ThemeMode.system
  home: SplashScreen(),
);
    
  }
}
