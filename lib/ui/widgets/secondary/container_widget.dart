import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key});

  ValueNotifier<BoxDecorationProvider> styleProvider = ValueNotifier(BoxDecorationProvider());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: styleProvider,
      builder: (context, value, child) {
        return Container(

          width: value.width ?? 200,
          height:value.height ?? 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(value.circularRadius *1.0),
            color: value.color
          ),
          
        );
      },
    );
  }
}
