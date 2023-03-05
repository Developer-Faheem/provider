import 'package:flutter/material.dart';

class FaviouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];

  List get selectedItems => _selectedItems;

  void setSelectedItems(int index) {
    _selectedItems.add(index);
    notifyListeners();
  }

  void removeSelectedItems(int index) {
    _selectedItems.remove(index);
    notifyListeners();
  }
}
