// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uuid/uuid.dart';

var uuid = Uuid();

// ignore: must_be_immutable
Map<EnumWidget, Map<String, String>> widgetOptions = {
  EnumWidget.text: {
    "Image": "assets/images/widgets/text_widget.png",
    "Color": "0xff59D5E0"
  },
  EnumWidget.row: {
    "Image": "assets/images/widgets/row_widget.png",
    "Color": "0xffFFD23F"
  },
  EnumWidget.column: {
    "Image": "assets/images/widgets/column_widget.png",
    "Color": "0xffA5DD9B"
  },
  EnumWidget.container: {
    "Image": "assets/images/widgets/container_widget.png",
    "Color": "0xff9195F6"
  }
};

class ToolWidget extends StatelessWidget {
  Object enumWidget;
  String? name;
  ToolWidget({required this.enumWidget, this.name});

  bool onHover = false;
  Widget widgetTool() {
    if (enumWidget is EnumWidget) {
      return SizedBox(
          height: 40.0,
          width: 40.0,
          child:
              Center(child: Image.asset(widgetOptions[enumWidget]!["Image"]!)));
    } else {
      return SizedBox(
        height: 60.0,
        width: 60.0,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/widgets/component_widget.png",
                width: 60.0,
                height: 60.0,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                name!,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = widgetTool();
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: Draggable<Object>(
        // Data is the value this Draggable stores.
        data: enumWidget,
        feedback: widget,

        child: widget,
      ),
    );
  }
}
