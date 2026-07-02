import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, stay, experience, shopping }

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
}