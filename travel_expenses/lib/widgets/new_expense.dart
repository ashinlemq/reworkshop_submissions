import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 40,
            decoration: InputDecoration(label: Text('Expense Title')),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: '\$',
              label: Text("Expense Amount"),
            ),
          ),
          const SizedBox(height: 20),
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
              ElevatedButton(onPressed: () { Navigator.pop(context); }, child: const Text("Cancel")),
            ],
          ),
        ],
      ),
    );
  }
}
