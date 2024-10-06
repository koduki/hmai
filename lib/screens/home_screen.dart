import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_entry.dart';
import '../widgets/meal_card.dart';
import '../providers/meal_entry_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealEntries = ref.watch(mealEntryListProvider);

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
                IconButton(
                  icon: const Icon(Icons.note_add, color: Colors.green),
                  onPressed: () {
                    ref.read(mealEntryListProvider.notifier).addMealEntry(
                          MealEntry(mealType: "新しい食事"),
                        );
                  },
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
