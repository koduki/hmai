import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_entry.dart';

class MealEntryList extends StateNotifier<List<MealEntry>> {
  MealEntryList() : super([]);

  void addMealEntry(MealEntry mealEntry) {
    state = [...state, mealEntry];
  }

  void updateMealEntry(int index, MealEntry mealEntry) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) mealEntry else state[i]
    ];
  }
}

final mealEntryListProvider =
    StateNotifierProvider<MealEntryList, List<MealEntry>>((ref) {
  return MealEntryList();
});
