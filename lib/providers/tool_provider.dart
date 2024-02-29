import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/tools_widget.dart';

class ToolProvider with ChangeNotifier {
  List<ToolWidget> toolWidgets = [];

  createTool(DataWidget dataWidget, String name,EnumWidget enumWidget,BuildContext context) {
    DataWidget data=DataWidget.copy(dataWidget,);
   
    toolWidgets.add(ToolWidget(
     enumWidget: {
      "data": dataWidget,
      "enum": enumWidget
     },
      name: name,
      
    ));
    notifyListeners();
  }
}
