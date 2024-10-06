import 'package:flutter/material.dart';
import '../models/food_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/meal_entry_provider.dart'; // 正しいパスに変更

class EditMealPage extends ConsumerWidget {
  final String mealType;

  EditMealPage({super.key, required this.mealType});

  final List<FoodItem> foodItems = [
    FoodItem(name: "アスパラガス(100g)", calories: 21),
    FoodItem(name: "むきえび(100gあたり)", calories: 83),
    FoodItem(name: "ベビーホタテ(100g)", calories: 100),
    FoodItem(name: "ほうれん草(1袋300g)", calories: 49),
    FoodItem(name: "スパゲッティ(1束100g)", calories: 352),
    FoodItem(name: "焼鯖定食", calories: 768),
    FoodItem(name: "サラダチキン ハーブ(85g)", calories: 134),
    FoodItem(name: "おにぎり 金しゃり", calories: 203),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealEntry = ref.watch(mealEntryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('$mealTypeの履歴'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Handle deletion of the food item (for now, just print)
                print('Deleted ${foodItems[index].name}');
              },
            ),
            title: Text(foodItems[index].name),
            subtitle: Text('${foodItems[index].calories} kcal'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle food item registration
                mealEntry.addFoodItem(foodItems[index]);
                print('Registered3 ${foodItems[index].name}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('登録'),
            ),
          );
        },
      ),
    );
  }
}
