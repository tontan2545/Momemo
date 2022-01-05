import 'package:flutter/cupertino.dart';

class Item {
  final UniqueKey id = UniqueKey();
  String name;
  double amount; 
  String description;
  final DateTime datetime = DateTime.now();

  Item(this.name, this.amount, this.description);

  void editItem(String name, double amount, String description) {
    this.name = name;
    this.amount = amount;
    this.description = description;
  }

}