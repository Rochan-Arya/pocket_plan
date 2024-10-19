import 'package:expense_tracker/models/expense_items.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBase {
  final _myBox = Hive.box("expense_database");

  void saveData(List<ExpenseItems> allExpenses) {
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpenses) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    _myBox.put("All_Expenses", allExpensesFormatted);
  }

  List<ExpenseItems> readData() {
    List savedExpenses = _myBox.get("All_Expenses") ?? [];
    List<ExpenseItems> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      ExpenseItems expense = ExpenseItems(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
