import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // following https://api.flutter.dev/flutter/material/Card-class.html
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: .min,
            children: [
              Text(
                expense.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                children: [
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8),
                      Text(
                          expense.formattedDate,
                          style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
    );
  }
}