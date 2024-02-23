import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:provider/provider.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    return Container(
        color: Colors.white60,
        child: Center(
          child: Container(
            child: DragTarget<String>(
              onAccept: (data) {
                phoneProvider.changeValue(data);
              },
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Consumer<PhoneProvider>(
                  builder: (context, value, child) {
                    return DynamicWidgetBuilder.build(
                        value.value == ""
                            ? '''{"type": "Center", "child": {"type": "Text", "data": "Choose widgets!"}}'''
                            : value.value,
                        context,
                        DefaultClickListener())!;
                  },
                );
              },
            ),
            width: 390,
            height: 590,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    // TODO: implement onClicked
  }
}
