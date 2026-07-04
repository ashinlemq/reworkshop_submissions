import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/expenses_list.dart';
import 'models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _myExpenses = [
    Expense(
      name: 'Birthday Dinner',
      amount: 300.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: 'Kayaking tour',
      amount: 70.0,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: ExpensesList(allExpenses: _myExpenses)),
            ],
          ),
        ),
      ),
    );
  }
}
