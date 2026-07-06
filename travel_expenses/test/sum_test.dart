import 'package:flutter_test/flutter_test.dart';
import 'package:travel_expenses/models/expense_model.dart';

void main() {
  test('Expenses should sum up correctly', () {

    final List<Expense> testExpenses = [
      Expense(
        name: 'Birthday Dinner',
        amount: 300.0,
        date: DateTime.now(),
        category: Category.food,
      ),
      Expense(
        name: 'Kayaking Lunch',
        amount: 70.0,
        date: DateTime.now(),
        category: Category.food,
      ),
    ];

    const bucket = ExpenseBucket(category: Category.food, expenses: []);
    final total = bucket.sumExpenses(testExpenses);

    expect(total, 370.0);
  });

  test('Expenses sum should be 0 when list is empty', () {
    final List<Expense> testExpenses = [];

    const bucket = ExpenseBucket(category: Category.food, expenses: []);
    final total = bucket.sumExpenses(testExpenses);

    expect(total, 0.0);
  });
}