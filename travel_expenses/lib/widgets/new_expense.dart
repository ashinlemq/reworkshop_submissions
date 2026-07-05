import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onaddExpense});

  void Function(Expense newExpense) onaddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;
  Category _chosenCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _chosenDate = selectedDate;
    });
  }

  void _saveExpenses() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _chosenDate == null) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
            'Please make sure a valid name, amount, and date are chosen',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onaddExpense(
      Expense(
        name: _titleController.text,
        amount: double.parse(_amountController.text),
        date: _chosenDate!,
        category: _chosenCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 40,
            decoration: InputDecoration(label: Text('Expense Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text("Expense Amount"),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    _chosenDate == null
                        ? 'Pick Date'
                        : formatter.format(_chosenDate!),
                    style: TextStyle(color: isDarkMode ? Colors.white : null),
                  ),
                  IconButton(
                    onPressed: _openDatePicker,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Text(
                "Expense Category",
                style: TextStyle(color: isDarkMode ? Colors.white : null),
              ),
              DropdownButton<Category>(
                value: _chosenCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : null,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _chosenCategory = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                    "Title: ${_titleController.text} \nAmount: \$${_amountController.text} \nDate: $_chosenDate \nCategory: $_chosenCategory",
                  );
                  _saveExpenses();
                },
                child: Text("Save Expense"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
