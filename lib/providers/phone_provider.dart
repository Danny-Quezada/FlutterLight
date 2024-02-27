import 'package:flutter/widgets.dart';

class PhoneProvider extends ChangeNotifier {
  List<Widget> widgets = [];
  bool changeHover=false;
  changeValue(Widget widget) {
    
    widgets.add(widget);
    notifyListeners();
  }
  changeValueIndex(Widget widget, index){
    widgets.insert(index, widget);
    notifyListeners();
  }
  changeValueHover(bool hover) {
    
    changeHover=hover;
    notifyListeners();
  }
}
