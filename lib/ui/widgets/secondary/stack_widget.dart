import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';


class StackWidget extends StatelessWidget {


   PhoneProvider? provider;
  StackWidget({required this.provider});

  StackWidget.copy(StackWidget stackWidget) {
    this.provider = PhoneProvider();
    this.provider!.widgets = stackWidget.provider!.widgets.map((widget) {
      return DataWidget.copy(widget);
    }).toList();
  }
 

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(),
    );
  }
}