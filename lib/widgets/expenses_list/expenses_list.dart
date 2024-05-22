import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/models/expense.dart';
import 'package:flutter_and_dart_course/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expenses[index]));
  }
}
