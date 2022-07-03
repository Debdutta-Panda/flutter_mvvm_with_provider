import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier{
  final _counter = ItemViewModel();
  get counter{
    return _counter;
  }
  onIncrement(){
    ++_counter._counter;
    //notifyListeners();
  }
}

class ItemViewModel with ChangeNotifier{
  var _counter = 0;
  get counter{
    return _counter;
  }
  onIncrement(){
    ++_counter;
    //notifyListeners();
  }
}