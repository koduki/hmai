import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_entry.dart';
import '../widgets/meal_card.dart';
import '../widgets/calorie_progress.dart';
import '../providers/meal_entry_list_provider.dart';

final targetDateProvider = StateNotifierProvider<TargetDateNotifier, DateTime>(
  (ref) => TargetDateNotifier(),
);

class TargetDateNotifier extends StateNotifier<DateTime> {
  TargetDateNotifier() : super(DateTime.now());

  void update(DateTime newDate) {
    state = newDate;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final mealEntries = ref.watch(mealEntryListProvider);
        final targetDate = ref.watch(targetDateProvider);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              '${targetDate.year}年${targetDate.month}月',
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              // Date Selector
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(7, (index) {
                    final displayedDate = targetDate.day - 3 + index;
                    return InkWell(
                      onTap: () {
                        ref.read(targetDateProvider.notifier).update(
                              DateTime(targetDate.year, targetDate.month,
                                  displayedDate),
                            );
                        print(ref.read(targetDateProvider));
                      },
                      child: CircleAvatar(
                        backgroundColor: displayedDate == targetDate.day
                            ? Colors.orange
                            : Colors.white,
                        child: Text(
                          '$displayedDate',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Calorie Intake Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("摂取カロリー"),
                    const SizedBox(height: 8),
                    Consumer(
                      builder: (context, ref, child) {
                        final intake = mealEntries.fold<int>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.totalCalories);
                        final goal = 2250; // ここを動的に変更する
                        return CalorieProgress(intake: intake, goal: goal);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mealEntries.length,
                  itemBuilder: (context, index) {
                    return MealCard(index: index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        ref.read(mealEntryListProvider.notifier).addMealEntry(
                              MealEntry(
                                  mealType: "食事:${mealEntries.length + 1}回目"),
                            );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
