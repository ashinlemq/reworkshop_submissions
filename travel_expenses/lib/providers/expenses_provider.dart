import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseState extends ChangeNotifier {
  List<Expense> _expenses = [];

  ExpenseState() {
    _loadExpenses();
  }

  List<Expense> get expenses => [..._expenses];

  Future<void> _saveExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String rawJsonString = jsonEncode(
      _expenses.map((expense) => expense.toJson()).toList(),
    );
    await prefs.setString('expenses_data', rawJsonString);
  }

  Future<void> _loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? rawJsonString = prefs.getString('expenses_data');

    if (rawJsonString != null) {
      final List<dynamic> decodedList = jsonDecode(rawJsonString);

      _expenses = decodedList.map((item) {
        return Expense.fromJson(item as Map<String, dynamic>);
      }).toList();
      notifyListeners();
    }
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    _saveExpenses();
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    _saveExpenses();
    notifyListeners();
  }
}