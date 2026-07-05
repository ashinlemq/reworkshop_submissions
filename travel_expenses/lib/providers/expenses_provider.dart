import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';

class ExpenseState extends ChangeNotifier {
  final List<Expense> _expenses = [
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

  List<Expense> get expenses => [..._expenses];

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }
}