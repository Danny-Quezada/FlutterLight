import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/ui_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';

class ToolsWidget extends StatelessWidget {
  ToolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    return Container(
        color: Colors.white60,
        child: ToolWidget(value: '''{"type": "Text", "data": "example"}
      ''', enumWidget: EnumWidget.text));
  }
}
