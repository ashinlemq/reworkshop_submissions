import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = ' ';

  void _handleTitleEntry(String inputText) {
    _enteredTitle = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: _handleTitleEntry,
            maxLength: 40,
            decoration: InputDecoration(label: Text('Expense Title')),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () { print(_enteredTitle); }, child: Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
