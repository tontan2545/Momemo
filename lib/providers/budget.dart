import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './item.dart';

class Budget with ChangeNotifier {
  final UniqueKey id = UniqueKey();
  String name;
  String description;
  List<Item> itemsHistory = [];
  double budgetAmount;
  double amountSpent = 0;
  final DateTime dateTime = DateTime.now();
  static double totalBudget = 0;
  static double totalSpent = 0;
  static int maxNoteCharacter = 20;

  Budget(
    this.name,
    this.description,
    this.budgetAmount,
  ) {
    totalBudget += this.budgetAmount;
    notifyListeners();
  }

  List<double> get getWeeklySpending {
    List<double> weekly = [0, 0, 0, 0, 0, 0, 0];
    int i = -1;
    for (Item item in itemsHistory) {
      if (item.datetime.isAfter(DateTime.now().subtract(Duration(days: 7)))) {
        switch (DateFormat('EEEE').format(item.datetime).substring(0, 3)) {
          case ("Mon"):
            i = 0;
            break;
          case ("Tue"):
            i = 1;
            break;
          case ("Wed"):
            i = 2;
            break;
          case ("Thu"):
            i = 3;
            break;
          case ("Fri"):
            i = 4;
            break;
          case ("Sat"):
            i = 5;
            break;
          case ("Sun"):
            i = 6;
            break;
          default:
            i = 0;
            break;
        }
        weekly[i] += item.amount;
      }
    }
    return weekly;
  }

  void editBudgetCategory(
    String name, String description, double budgetAmount) {
    totalBudget -= this.budgetAmount;
    this.name = name;
    this.description = description;
    this.budgetAmount = budgetAmount;
    totalBudget += this.budgetAmount;
    notifyListeners();
  }

  void addBudgetAmount(double amount) {
    this.budgetAmount += amount;
    totalBudget += amount;
    notifyListeners();
  }

  void subtractBudgetAmount(double amount) {
    if(budgetAmount >= amount) budgetAmount -= amount;
    else budgetAmount = 0;
    if(totalBudget >= amount) totalBudget -= amount;
    else totalBudget = 0;
    notifyListeners();
  }

  void addSpending(String name, double amount, String description) {
    this.itemsHistory.add(Item(name, amount, description));
    amountSpent += amount;
    totalSpent += amount;
    print("spening added!");
    notifyListeners();
  }

  static double get getRemainingBudget {
    return totalBudget - totalSpent;
  }

  double get getCurrentRemainingBudget {
    return this.budgetAmount - this.amountSpent;
  }

  void removeItem(UniqueKey id) {
    Item item = this.itemsHistory.firstWhere((element) => element.id == id);
    this.amountSpent -= item.amount;
    Budget.totalSpent -= item.amount;
    this.itemsHistory.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void editItem(UniqueKey id, String name, double amount, String note) {
    Item item = this.itemsHistory.firstWhere((element) => element.id == id);
    this.amountSpent += amount - item.amount;
    Budget.totalSpent += amount - item.amount;
    item.editItem(name, amount, note);
    notifyListeners();
  }
}
