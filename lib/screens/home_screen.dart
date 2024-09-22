import 'package:flutter/material.dart';
import '../models/meal_entry.dart';
import '../widgets/meal_card.dart';
import 'edit_meal_page.dart';

class HomeScreen extends StatelessWidget {
  final List<MealEntry> mealEntries = [
    MealEntry(
      mealType: "朝食",
      calorieCount: 78,
      description: "なめらかプリン(1個70g)(雪印メグミルク)",
      imageUrl: 'https://www.namepuri.com/img/topics_img.jpg',
      itemCount: 1,
    ),
    MealEntry(
      mealType: "昼食2",
      calorieCount: 334,
      description: "ザバス SOY PROTEIN 100 ココア味(1食分28g) (明治)\n赤飯おこわ(1個)(セブンイレブン)",
      imageUrl: 'https://www.namepuri.com/img/topics_img.jpg',
      itemCount: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('2024年9月', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mealEntries.length,
              itemBuilder: (context, index) {
                return MealCard(mealEntry: mealEntries[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.note_add, color: Colors.green),
                  onPressed: () {},
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add),
                  onPressed: () {
                    // Add action
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
