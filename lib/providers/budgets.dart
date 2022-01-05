import 'package:flutter/material.dart';

import 'budget.dart';

class Budgets with ChangeNotifier{

  void addNewBudget(String name, String description, double startingBudget) {
    budgets.add(Budget(name,description,startingBudget));
    notifyListeners();
  }

  void removeBudget(UniqueKey budgetKey) {
    budgets.removeWhere((budget) {
      if(budget.id != budgetKey) return false;
      Budget.totalBudget -= budget.budgetAmount;
      Budget.totalSpent -= budget.amountSpent;
      return true;
    });
    notifyListeners();
  }

  List<Budget> budgets = [
    Budget(
      "Shopping",
      "For shopping only",
      6000,
    ),
    Budget(
      "Education",
      "For education only",
      4000,
    ),
    Budget(
      "Travel",
      "For travel only",
      5000,
    ),
    Budget(
      "Food",
      "For food only",
      2000,
    ),
    Budget(
      "Family",
      "For family only",
      2000,
    ),
  ];
}
