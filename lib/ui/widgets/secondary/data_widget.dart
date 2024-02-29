import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';

import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:flutter_drag_drop/providers/tool_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/utils/validator.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/column_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/container_widget.dart';

import 'package:flutter_drag_drop/ui/widgets/secondary/row_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/stack_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/text_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';

class DataWidget extends StatelessWidget {
  DataWidget.copy(DataWidget dataWidget) {
    this.key = UniqueKey();
    if (dataWidget.widgetData is ContainerWidget) {
      this.widgetData =
          ContainerWidget.copy(dataWidget.widgetData as ContainerWidget);
    }
    if (dataWidget.widgetData is RowWidget) {
      this.widgetData = RowWidget.copy(dataWidget.widgetData as RowWidget);
    }
    if (dataWidget.widgetData is ColumnWidget) {
      this.widgetData =
          ColumnWidget.copy(dataWidget.widgetData as ColumnWidget);
    }
    if (dataWidget.widgetData is TextWidget) {
      this.widgetData = TextWidget.copy(dataWidget.widgetData as TextWidget);
    }
    if(dataWidget.widgetData is StackWidget){
      this.widgetData=StackWidget.copy(dataWidget.widgetData as StackWidget);
    }
    this.enumWidget = dataWidget.enumWidget;
    this.phoneProvider = PhoneProvider();

    DataWidget data = DataWidget(enumWidget: dataWidget.enumWidget);
    data.key = UniqueKey();
    // if (dataWidget.widgetData is RowWidget) {
    //   dataWidget.widgetCompleted=RowWidget.copy(dataWidget.widgetData as RowWidget);
    // }

    data.enumWidget = dataWidget.enumWidget;
    data.phoneProvider = PhoneProvider();
  }

  EnumWidget? enumWidget;
  Key? key;
  DataWidget({required this.enumWidget, this.key, this.widgetData})
      : super(key: key) {
    phoneProvider = PhoneProvider();
  }
  Widget? widgetData = null;
  PhoneProvider phoneProvider = PhoneProvider();

  widgetFactory() {
    switch (enumWidget!) {
      case EnumWidget.text:
        widgetData = TextWidget();
      case EnumWidget.row:
        widgetData = RowWidget(
          provider: PhoneProvider(),
        );
      case EnumWidget.column:
        widgetData = ColumnWidget(provider: PhoneProvider());
      case EnumWidget.container:
        widgetData = ContainerWidget();
      case EnumWidget.stack:
        widgetData=StackWidget(provider: PhoneProvider());
    }
  }

  final nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _showPopupMenu(Offset offset, BuildContext context) async {
    final toolProvider = Provider.of<ToolProvider>(context, listen: false);
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(offset, offset),
      Offset.zero & overlay.size,
    );

    double left = offset.dx;
    
    double top = offset.dy;
    await showMenu(
      context: context,
      position: //.fromLTRB(left, top, 0, 0),
          position,
      items: [
        PopupMenuItem(
          child: const Row(
            children: [
              Icon(
                Icons.create,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Create widget")
            ],
          ),
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            autofocus: true,
                            controller: nameController,
                            validator: ValidarTextField.genericStringValidator,
                            decoration: const InputDecoration(
                                hintText: "Widget's name"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              final FormState form = _formKey.currentState!;

                              if (form.validate()) {
                                toolProvider.createTool(this!,
                                    nameController.text, enumWidget!, context);
                              }
                            },
                            icon: const Icon(Icons.create),
                            label: const Text("Create component"),
                          )
                        ],
                      )),
                );
              },
            );
          },
        ),
        PopupMenuItem(
            onTap: () {
              phoneProvider.deleteWidget(this);
            },
            child: const Row(
              children: [
                Icon(Icons.delete_forever),
                SizedBox(
                  width: 10,
                ),
                Text("Delete widget")
              ],
            )),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context, listen: false);

    if (widgetData == null) {
      widgetFactory();
    }

    return InkWell(
      onSecondaryTapDown: (details) {
        print(enumWidget);
        _showPopupMenu(details.globalPosition, context);
      },
      onTapDown: (details) {},
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        print(enumWidget);
      },
      onHover: (value) {
        phoneProvider.changeValueHover(value);
      },
      onDoubleTap: () {
        if (enumWidget == EnumWidget.text) {
          styleProvider.valueProvider =
              (this.widgetData as TextWidget).styleProvider.value;
          styleProvider.changeEnum(enumWidget!);
        } else if (enumWidget == EnumWidget.container) {
          styleProvider.boxDecorationProvider =
              (this.widgetData as ContainerWidget).value;

          styleProvider.changeEnum(enumWidget!);
        }
      },
      child: ChangeNotifierProvider.value(
        value: phoneProvider,
        child: Consumer<PhoneProvider>(
          builder: (context, value, child) {
            return Badge(
              isLabelVisible: value.changeHover,
              label: value.changeHover ? Text(enumWidget!.name) : null,
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
