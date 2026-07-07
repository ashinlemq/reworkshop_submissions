import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_expenses/models/expense_model.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('ExpenseState Tests', () {
    test('Initial expenses list should be empty', () async {
      final expenseState = ExpenseState();
      await Future.delayed(Duration.zero);

      expect(expenseState.expenses, isEmpty);
    });

    test('addExpense should add an expense and notify listeners', () async {
      final expenseState = ExpenseState();
      await Future.delayed(Duration.zero);

      var listenerNotified = false;
      expenseState.addListener(() {
        listenerNotified = true;
      });

      final testExpense = Expense(
        name: 'Food',
        amount: 15.5,
        date: DateTime.now(),
        category: Category.food,
      );

      expenseState.addExpense(testExpense);

      expect(expenseState.expenses.length, 1);
      expect(expenseState.expenses.first.name, 'Food');
      expect(listenerNotified, isTrue);
    });

    test('removeExpense should remove an expense by its ID and notify listeners', () async {
      final expenseState = ExpenseState();
      await Future.delayed(Duration.zero);

      final testExpense = Expense(
        name: 'Food',
        amount: 15.5,
        date: DateTime.now(),
        category: Category.food,
      );

      expenseState.addExpense(testExpense);
      final expenseId = expenseState.expenses.first.id;

      var listenerNotified = false;
      expenseState.addListener(() {
        listenerNotified = true;
      });

      expenseState.removeExpense(expenseId);

      expect(expenseState.expenses, isEmpty);
      expect(listenerNotified, isTrue);
    });
  });
}