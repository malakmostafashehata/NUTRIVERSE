import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

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
      home: const Scaffold(body: Center(child: Text('Welcome to NUTRIVERSE'))),
    );
  }
}
