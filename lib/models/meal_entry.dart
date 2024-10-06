import 'package:hmai/models/food_item.dart';

class MealEntry {
  final String mealType;
  final List<FoodItem> foodItems;

  MealEntry({
    required this.mealType,
    List<FoodItem>? foodItems,
  }) : foodItems = foodItems ?? [];

  MealEntry copyWith({String? mealType, List<FoodItem>? foodItems}) {
    return MealEntry(
      mealType: mealType ?? this.mealType,
      foodItems: foodItems ?? this.foodItems,
    );
  }

  // Total calories for the meal
  int get totalCalories {
    return foodItems.fold(0, (sum, item) => sum + item.calories);
  }
}
