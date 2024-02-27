import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  TextStyle textStyle=TextStyle(
    color: Colors.black,
    
  );
  TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      selectionHeightStyle: BoxHeightStyle.tight,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: textStyle,
      decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: "Text",
          contentPadding: EdgeInsets.zero),
      controller: textEditingController,
    );
  }
}
