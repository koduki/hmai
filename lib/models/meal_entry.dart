import 'package:hmai/models/food_item.dart';

import 'package:flutter/foundation.dart';

class MealEntry with ChangeNotifier {
  final String mealType;
  final List<FoodItem> _foodItems = [];
  List<FoodItem> get foodItems => _foodItems;

  MealEntry({
    required this.mealType,
  });

  void add(FoodItem item) {
    _foodItems.add(item);
    notifyListeners();
  }

  // Total calories for the meal
  int get totalCalories {
    return foodItems.fold(0, (sum, item) => sum + item.calories);
  }
}

// class MealEntryList extends ChangeNotifier {
//   final List<MealEntry> _entries = [];

//   List<MealEntry> get entries => _entries;

//   void add(MealEntry entry) {
//     _entries.add(entry);
//     notifyListeners();
//   }

//   MealEntry get(int index) => _entries[index];

//   int get size => _entries.length;
// }
