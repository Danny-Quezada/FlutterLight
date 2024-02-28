import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/column_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/container_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/row_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/text_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';

class DataWidget extends StatelessWidget {
  final EnumWidget enumWidget;

  DataWidget({required this.enumWidget, Key? key}) : super(key: key);

  Widget? widgetData = null;
  Widget? widgetCompleted = null;
  widgetFactory() {
    switch (enumWidget) {
      case EnumWidget.text:
        widgetData = TextWidget(
          key: key,
        );
        widgetCompleted = IntrinsicWidth(child: widgetData);
      case EnumWidget.row:
        widgetData = RowWidget(
          provider: PhoneProvider(),
        );
        widgetCompleted = IntrinsicHeight(child: widgetData);
      case EnumWidget.column:
        widgetData = ColumnWidget(provider: phoneProvider);
        widgetCompleted = IntrinsicHeight(child: widgetData);
      case EnumWidget.container:
        widgetCompleted = ContainerWidget();
    }
  }

  PhoneProvider phoneProvider = PhoneProvider();

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context, listen: false);
    final globalProvider = Provider.of<PhoneProvider>(context, listen: false);
    if (widgetData == null) {
      widgetFactory();
    }
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        print("object");
      },
      onHover: (value) {
        phoneProvider.changeValueHover(value);
      },
      onDoubleTap: () {
        if (enumWidget == EnumWidget.text) {
          styleProvider.valueProvider =
              (widgetData as TextWidget).styleProvider.value;
          styleProvider.changeEnum(this.enumWidget);
        }
        else if(enumWidget==EnumWidget.container){
             styleProvider.boxDecorationProvider =
              (widgetCompleted as ContainerWidget).styleProvider.value;
          styleProvider.changeEnum(this.enumWidget);
        }
      },
      child: ChangeNotifierProvider.value(
        value: phoneProvider,
        child: Consumer<PhoneProvider>(
          builder: (context, value, child) {
            return Badge(
              isLabelVisible: value.changeHover,
              label: value.changeHover ? Text(enumWidget.name) : null,
              backgroundColor:
                  Color(int.parse(widgetOptions[enumWidget]!["Color"]!)),
              child: Container(
                  decoration: value.changeHover
                      ? BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(int.parse(
                                  widgetOptions[enumWidget]!["Color"]!))))
                      : null,
                  child: widgetCompleted),
            );
          },
        ),
      ),
    );
  }
}
