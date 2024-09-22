import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<MealEntry> mealEntries = [
    MealEntry(
      mealType: "朝食",
      calorieCount: 78,
      description: "なめらかプリン(1個70g)(雪印メグミルク)",
      imageUrl:
          'https://www.namepuri.com/img/topics_img.jpg', // Replace with actual image URL
      itemCount: 1,
    ),
    MealEntry(
      mealType: "昼食",
      calorieCount: 334,
      description: "ザバス SOY PROTEIN 100 ココア味(1食分28g) (明治)\n赤飯おこわ(1個)(セブンイレブン)",
      imageUrl:
          'https://www.namepuri.com/img/topics_img.jpg', // Replace with actual image URL
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
          // Meal Entry Section
          Expanded(
            child: ListView.builder(
              itemCount: mealEntries.length,
              itemBuilder: (context, index) {
                return MealCard(mealEntry: mealEntries[index]);
              },
            ),
          ),

          // Floating Action Button (same as previous)
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

// Model for Meal Entry
class MealEntry {
  final String mealType;
  final int calorieCount;
  final String description;
  final String imageUrl;
  final int itemCount;

  MealEntry({
    required this.mealType,
    required this.calorieCount,
    required this.description,
    required this.imageUrl,
    required this.itemCount,
  });
}

// Meal Card Widget
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
                  mealEntry.mealType == "朝食"
                      ? Icons.wb_sunny
                      : Icons.wb_cloudy, // Different icons for breakfast/lunch
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
                    // Navigate to EditMealPage when pencil is clicked
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

// New Page for Editing Meals
class EditMealPage extends StatelessWidget {
  final String mealType;

  EditMealPage({required this.mealType});

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
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.close),
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
                print('Registered ${foodItems[index].name}');
              },
              child: Text('登録'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model for Food Items
class FoodItem {
  final String name;
  final int calories;

  FoodItem({required this.name, required this.calories});
}
