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
    //notifyListeners();
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

class BoxDecorationProvider {
  int circularRadius = 0;
  Color color = Colors.white;
  double height = 200;
  double width = 200;
}
