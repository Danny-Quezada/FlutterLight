import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';

class ToolWidget extends StatelessWidget {
  String value;

  EnumWidget enumWidget;
  Map<EnumWidget, String> pictures = {
    EnumWidget.text: "assets/images/widgets/text_widget.png"
  };

  ToolWidget({required this.value, required this.enumWidget});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      // Data is the value this Draggable stores.
      data: value,
      feedback: Container(
        height: 120.0,
        width: 120.0,
        child: Center(
          child: Image.asset(pictures[enumWidget]!),
        ),
      ),
      child: Container(
        height: 120.0,
        width: 120.0,
        child: Center(
          child: Image.asset(pictures[enumWidget]!),
        ),
      ),
    );
  }
}
