import 'package:flutter/material.dart';
import 'package:hmai/models/food_item.dart';
import '../models/meal_entry.dart';
import '../widgets/meal_card.dart';
import 'edit_meal_page.dart';
import 'package:provider/provider.dart'; // 追加

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealEntries = Provider.of<MealEntryList>(context);

    mealEntries.get(0).add(FoodItem(
          name: "なめらかプリン(1個70g)(雪印メグミルク)",
          calories: 78,
          imageUrl: 'https://www.namepuri.com/img/topics_img.jpg',
        ));
    mealEntries.get(1).add(FoodItem(
          name: "ザバス2",
          calories: 78,
          imageUrl: 'https://www.namepuri.com/img/topics_img.jpg',
        ));
    mealEntries.get(1).add(FoodItem(
          name: "赤飯おこわ(1個)(セブンイレブン)",
          calories: 227,
          imageUrl: 'https://www.namepuri.com/img/topics_img.jpg',
        ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('2024年10月', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mealEntries.size,
              itemBuilder: (context, index) {
                return MealCard(mealEntry: mealEntries.get(index));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.note_add, color: Colors.green),
                  onPressed: () {},
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
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
