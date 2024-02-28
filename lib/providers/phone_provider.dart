import 'package:flutter/widgets.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';

class PhoneProvider extends ChangeNotifier {
  List<DataWidget> widgets = [];
  bool changeHover=false;

  Key key=Key("");






  changeValue(DataWidget widget) {
    
    widgets.add(widget);
    notifyListeners();
  }
  changeValueIndex(DataWidget widget, index){

    
    widgets.insert(index, widget);
    notifyListeners();
  }
  changeValueHover(bool hover) {
    
    changeHover=hover;
    notifyListeners();
  }
}
