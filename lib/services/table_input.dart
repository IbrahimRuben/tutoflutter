import 'package:flutter/material.dart';
import 'package:tutoflutter/modules/item_table.dart';

class TableInput extends ChangeNotifier {
  List<ItemTable> tableList = [
    ItemTable(name: 'Ruben', age: 23),
    ItemTable(name: 'Elias', age: 51),
  ];

  List<ItemTable> getTable() {
    return tableList;
  }

  void addItemTable(ItemTable item) {
    tableList.add(item);
    notifyListeners();
  }

  void removeItemTable(ItemTable item) {
    tableList.remove(item);
    notifyListeners();
  }
}
