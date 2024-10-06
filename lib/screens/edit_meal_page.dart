import 'package:flutter/material.dart';
import '../models/food_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/meal_entry_provider.dart';

class EditMealPage extends ConsumerWidget {
  final int mealEntryIndex;

  EditMealPage({super.key, required this.mealEntryIndex});

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
    final mealEntryList = ref.watch(mealEntryListProvider);
    final mealEntry = mealEntryList[mealEntryIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${mealEntry.mealType}の履歴'),
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
                ref.read(mealEntryListProvider.notifier).updateMealEntry(
                      mealEntryIndex,
                      mealEntry..add(foodItems[index]),
                    );
                print('Registered ${foodItems[index].name}');
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
