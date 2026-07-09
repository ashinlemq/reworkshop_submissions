import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/chart/chart.dart';
import 'package:travel_expenses/widgets/expenses_list.dart';
import 'package:travel_expenses/widgets/new_expense.dart';
import 'package:provider/provider.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, this.auth});

  final FirebaseAuth? auth;

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  FirebaseAuth get _auth => widget.auth ?? FirebaseAuth.instance;

  void _openAddExpenseItemOverlay() {
    final state = Provider.of<ExpenseState>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) => NewExpense(onaddExpense: state.addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = _auth.currentUser?.email ?? 'No Email';

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(userEmail),
          ),
        ),
        centerTitle: true,
        title: Text("Travel Expenses"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseItemOverlay,
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _auth.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Consumer<ExpenseState>(
            builder: (context, expensesState, child) {
              return Column(
                children: [
                  Chart(expenses: expensesState.expenses),
                  Expanded(
                    child: ExpensesList(
                      allExpenses: expensesState.expenses,
                      onRemoveExpense: (expense) {
                        expensesState.removeExpense(expense.id);

                        ScaffoldMessenger.of(context).clearSnackBars();

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${expense.name} deleted.'),
                                duration: const Duration(seconds: 3),
                                action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      expensesState.addExpense(expense);
                                    },
                                ),
                            ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
