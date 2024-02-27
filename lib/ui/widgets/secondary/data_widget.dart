import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/column_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/container.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/row_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/text_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';

class DataWidget extends StatelessWidget {
  final EnumWidget enumWidget;

  DataWidget({required this.enumWidget});

  Widget? widgetData = null;

  widgetFactory() {
    switch (enumWidget) {
      case EnumWidget.text:
        widgetData = IntrinsicWidth(child: TextWidget());
      case EnumWidget.row:
        widgetData = IntrinsicHeight(
          child: RowWidget(
            provider: PhoneProvider(),
          ),
        );
      case EnumWidget.column:
        widgetData =
            IntrinsicHeight(child: ColumnWidget(provider: phoneProvider));
      case EnumWidget.container:
        widgetData=ContainerWidget();
    }
  }

  PhoneProvider phoneProvider = PhoneProvider();

  @override
  Widget build(BuildContext context) {
    if (widgetData == null) {
      widgetFactory();
    }
    return InkWell(
      key: Key(uuid.v4()),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        print("object");
      },
      onHover: (value) {
        phoneProvider.changeValueHover(value);
      },
      onDoubleTap: (){
        print("prueba");
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
                  child: widgetData),
            );
          },
        ),
      ),
    );
  }
}
