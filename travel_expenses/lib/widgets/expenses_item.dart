import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';
import 'package:provider/provider.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          'Confirm Deletion',
        ),
        content: Text(
          'Are you sure you want to remove this expense?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<ExpenseState>(
                context,
                listen: false,
              ).removeExpense(expense.id);
              Navigator.pop(dialogContext);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

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
            IconButton(
              onPressed: () => _showDeleteConfirmation(context),
              icon: const Icon(Icons.delete_forever),
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
            ),
          ],
        ),
      ),
    );
  }
}
