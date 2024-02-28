import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  TextStyle textStyle = const TextStyle(
    color: Colors.black,
  );
  TextWidget({super.key});
   ValueNotifier<ValueProvider> styleProvider = ValueNotifier(ValueProvider());
  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return TextField(
          textAlign: styleProvider.value.textAlign,
        selectionHeightStyle: BoxHeightStyle.tight,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: value.textStyle,
        decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: "Text",

            contentPadding: EdgeInsets.zero),
        controller: textEditingController,
      );
      },
      valueListenable: styleProvider,
      
    );
  }
}
