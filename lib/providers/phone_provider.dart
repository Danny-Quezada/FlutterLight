import 'package:flutter/widgets.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/row_widget.dart';

class PhoneProvider extends ChangeNotifier {
  List<DataWidget> widgets = [];
  bool changeHover = false;

  DataWidget? widget;
  Key key = Key("");

  changeValue(DataWidget widget) {
    if (widget.enumWidget == EnumWidget.row ||
        widget.enumWidget == EnumWidget.column) {}
    widgets.add(widget);

    notifyListeners();
  }

  changeValueIndex(DataWidget widget, index) {
    widgets.insert(index, widget);
    notifyListeners();
  }

  changeValueHover(bool hover) {
    changeHover = hover;
    notifyListeners();
  }

  deleteWidget(DataWidget data) {
    widgets.remove(data);
    notifyListeners();
  }
}
