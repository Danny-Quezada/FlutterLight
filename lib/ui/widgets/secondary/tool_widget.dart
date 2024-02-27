// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/row_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/text_widget.dart';
import 'package:provider/provider.dart';

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
  EnumWidget.column:{
    "Image": "assets/images/widgets/column_widget.png",
    "Color": "0xffA5DD9B"
  },
  EnumWidget.container:{
    "Image": "assets/images/widgets/container_widget.png",
    "Color": "0xff9195F6"
  }
};

class ToolWidget extends StatelessWidget {
  EnumWidget enumWidget;

  ToolWidget({
    required this.enumWidget,
  });

  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: Draggable<EnumWidget>(
        // Data is the value this Draggable stores.
        data: enumWidget,
        feedback: Container(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: Image.asset(widgetOptions[enumWidget]!["Image"]!),
          ),
        ),
        child: Container(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: Image.asset(widgetOptions[enumWidget]!["Image"]!),
          ),
        ),
      ),
    );
  }
}
