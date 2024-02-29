import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  ValueNotifier<ValueProvider> styleProvider = ValueNotifier(ValueProvider());
  TextWidget({super.key});
  final TextEditingController textEditingController = TextEditingController();

  TextStyle textStyle = const TextStyle(
    color: Colors.black,
  );
TextWidget.copy(TextWidget textWidget){
   this.styleProvider.value.textAlign=textWidget.styleProvider.value.textAlign;
   this.styleProvider.value.textStyle=textWidget.styleProvider.value.textStyle;
   this.textEditingController.value=textWidget.textEditingController.value;
    
  
  }
  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
      key: key,
      builder: (context, value, child) {
        return IntrinsicWidth(
          child: TextField(
            textAlign: styleProvider.value.textAlign,
          selectionHeightStyle: BoxHeightStyle.tight,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: styleProvider.value.textStyle,
          decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: "Text",
          
              contentPadding: EdgeInsets.zero),
          controller:textEditingController,
                ),
        );
      },
      valueListenable: styleProvider,
      
    );
  }
}
