import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;

  int get count =>
      _count; //getter method , we will get count value from anywhere in aap using the provider class

  void setCount() {
    _count++;
    notifyListeners();
  }
}
