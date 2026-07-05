import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, stay, experience, shopping }

const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.stay: Icons.hotel,
  Category.experience: Icons.snowboarding,
  Category.shopping: Icons.shopping_basket,
};

final formatter = DateFormat.yMd();

class Expense {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Enum category;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Auto assigns unique string ID on creation

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
