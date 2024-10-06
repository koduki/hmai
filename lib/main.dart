import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodをインポート

import 'models/meal_entry.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      // ProviderScopeでラップ
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Health Management AI',
      home: HomeScreen(),
    );
  }
}
