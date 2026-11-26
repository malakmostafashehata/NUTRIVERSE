import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/authentication/presentation/screens/welcome_screen.dart';

void main() {
  runApp(const NutriverseApp());
}

class NutriverseApp extends StatelessWidget {
  const NutriverseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NUTRIVERSE',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
