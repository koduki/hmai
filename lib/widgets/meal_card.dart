import 'package:flutter/material.dart';
import '../models/meal_entry.dart';
import '../screens/edit_meal_page.dart';

class MealCard extends StatelessWidget {
  final MealEntry mealEntry;

  MealCard({required this.mealEntry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                SizedBox(width: 8),
                Text(
                  mealEntry.mealType,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditMealPage(mealType: mealEntry.mealType)),
                    );
                  },
                ),
                Text(
                  '${mealEntry.calorieCount} kcal',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  mealEntry.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    mealEntry.description,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
