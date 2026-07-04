import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;

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

  @override
  Widget build(BuildContext context) {
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
                  Text(_chosenDate == null
                    ? 'Pick Date'
                      : formatter.format(_chosenDate!),
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
              Text("Expense Category"),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                    "Title: ${_titleController.text} \nAmount: \$${_amountController.text}",
                  );
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
