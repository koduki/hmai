import 'package:flutter/material.dart';

class CalorieProgress extends StatelessWidget {
  final int intake;
  final int goal;

  const CalorieProgress({super.key, required this.intake, required this.goal});

  @override
  Widget build(BuildContext context) {
    double progress = intake / goal;
    int diff = goal - intake;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("合計 $intake kcal"),
            Text("目標 $goal kcal"),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade300,
          color: progress < 1.0 ? Colors.yellow : Colors.red,
        ),
        const SizedBox(height: 8),
        Text("${diff > 0 ? "不足" : "過剰"} ${diff.abs()} kcal"),
      ],
    );
  }
}
