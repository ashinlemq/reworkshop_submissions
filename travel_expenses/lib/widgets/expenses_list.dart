import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';
import 'package:travel_expenses/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> allExpenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList({super.key, required this.allExpenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (listContext, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(allExpenses[index]);
        },
        key: ValueKey(allExpenses[index]),
        child: ExpenseItem(expense: allExpenses[index]),
      ),
    );
  }
}