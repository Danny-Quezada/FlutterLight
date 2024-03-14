import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';

class StyleProvider extends ChangeNotifier {
  EnumWidget? enumWidget;
  // StyleProvider styleProvider=StyleProvider();
  Key key = Key("");
  ValueProvider valueProvider = ValueProvider();
  BoxDecorationProvider _boxDecorationProvider = BoxDecorationProvider();

  BoxDecorationProvider get boxDecorationProvider => _boxDecorationProvider;

  set boxDecorationProvider(BoxDecorationProvider value) {
    _boxDecorationProvider = value;
    notifyListeners();
  }

  changeStyle(TextStyle style) {
    // styleProvider.textStyle.merge(style);
    valueProvider.textStyle = style;
    notifyListeners();
  }

  changeEnum(EnumWidget enumWidgetChanged) {
    enumWidget = enumWidgetChanged;
    notifyListeners();
  }

  changeAlign(TextAlign align) {
    // styleProvider.textAlign=align;
    valueProvider.textAlign = align;
    //  notifyListeners();
  }
}

class ValueProvider {
  TextStyle textStyle = TextStyle();
  TextAlign textAlign = TextAlign.left;
}

class BoxDecorationProvider with ChangeNotifier {
  int _circularRadius = 0;

  int get circularRadius => _circularRadius;

  set circularRadius(int value) {
    _circularRadius = value;
    notifyListeners();
  }
  Color _color = Colors.white;

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  double _height = 200;

  double get height => _height;

  set height(double value) {
    _height = value;
    notifyListeners();
  }
  double _width = 200;

  double get width => _width;

  set width(double value) {
    _width = value;
    notifyListeners();
  }
}
