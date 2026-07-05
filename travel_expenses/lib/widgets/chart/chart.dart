import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';
import 'package:travel_expenses/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return Category.values.map((category) {
      return ExpenseBucket.forCategory(expenses, category);
    }).toList();
  }

  double get maxTotalExpense {
    double maxTotal = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotal) {
        maxTotal = bucket.totalExpenses;
      }
    }
    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: .end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: maxTotalExpense == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    categoryIcons[bucket.category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
                  ),
                ),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}