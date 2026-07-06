import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_expenses/expenses.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  // Create a helper function to repeat less
  Widget testExpenseWidget() {
    return ChangeNotifierProvider<ExpenseState>(
      create: (context) => ExpenseState(),
      child: const MaterialApp(
        home: Expenses(),
      ),
    );
  }

  // Test the app bar
  testWidgets('Expenses has an AppBar with title and add button', (tester) async {
    await tester.pumpWidget(testExpenseWidget());
    await tester.pumpAndSettle();

    expect(find.text('Travel Expenses'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  // See if the add button works
  testWidgets('Open bottom sheet modal when add button is clicked', (tester) async {
    await tester.pumpWidget(testExpenseWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsAtLeastNWidgets(2));
  });
}