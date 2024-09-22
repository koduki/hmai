import 'package:flutter/material.dart';
import '../models/meal_entry.dart';
import '../screens/edit_meal_page.dart';
import 'package:provider/provider.dart'; // 追加

class MealCard extends StatelessWidget {
  final MealEntry mealEntry;

  const MealCard({super.key, required this.mealEntry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  mealEntry.mealType == "朝食"
                      ? Icons.wb_sunny
                      : Icons.wb_cloudy, // Different icons for breakfast/lunch
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  mealEntry.mealType,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${mealEntry.totalCalories} kcal',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {
                    // Navigate to EditMealPage when pencil is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => mealEntry,
                              child:
                                  EditMealPage(mealType: mealEntry.mealType))),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mealEntry.menuItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Image.network(
                        item.imageUrl ??
                            'https://www.namepuri.com/img/topics_img.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              '${item.calories} kcal',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
