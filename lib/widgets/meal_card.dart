import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_entry.dart';
import '../providers/meal_entry_provider.dart';

class MealCard extends ConsumerWidget {
  final int index;

  const MealCard({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealEntry = ref.watch(mealEntryListProvider)[index];

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
                  mealEntry.mealType == "朝食" ? Icons.wb_sunny : Icons.wb_cloudy,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProviderScope(
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
              children: mealEntry.foodItems.map((item) {
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
