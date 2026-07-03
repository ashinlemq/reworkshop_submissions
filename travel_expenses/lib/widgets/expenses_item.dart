import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(expense.name)
        ],
      ),
    );
  }
}