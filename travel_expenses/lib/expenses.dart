import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/chart/chart.dart';
import 'package:travel_expenses/widgets/expenses_list.dart';
import 'package:travel_expenses/widgets/new_expense.dart';
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

  void _addExpense(Expense expense) {
    setState(() {
      _myExpenses.add(expense);
    });
  }

  void _openAddExpenseItemOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) => NewExpense(onaddExpense: _addExpense),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _myExpenses.indexOf(expense);

    setState(() {
      _myExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _myExpenses.insert(
                expenseIndex,
                expense,
              ); // Reinserts item at original spot
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Travel Expenses"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseItemOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chart(expenses: _myExpenses),
              Expanded(
                child: ExpensesList(
                  allExpenses: _myExpenses,
                  onRemoveExpense: _removeExpense,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
