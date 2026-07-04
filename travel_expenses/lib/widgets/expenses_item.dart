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
        child: Column(
          mainAxisSize: .min,
          children: [
            ListTile(
              leading: Text("\$${expense.amount.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold),),
              title: Text(expense.name),
              subtitle: Row(
                children: [
                  Icon(Icons.fastfood),
                  Text(expense.date.toString()),
                ],
              ),
            ),
          ],
        ),
    );
  }
}