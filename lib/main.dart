import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 追加

import 'models/meal_entry.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealEntryList()
        ..add(MealEntry(mealType: "朝食"))
        ..add(MealEntry(mealType: "昼食")),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Management AI',
      home: HomeScreen(),
    );
  }
}
