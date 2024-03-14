import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:provider/provider.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key});

  ValueNotifier<BoxDecorationProvider> value =
      ValueNotifier(BoxDecorationProvider());

  ContainerWidget.copy(ContainerWidget container) {
    this.value.value.circularRadius = container.value.value.circularRadius;
    this.value.value.color = container.value.value.color;
    this.value.value.height = container.value.value.height;
    this.value.value.width = container.value.value.width;
    // this.value=container.value;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: value.value,
      child: Consumer<BoxDecorationProvider>(
        builder: (context, valuestyle, child) {
          return Container(
            width: value.value.width,
            height: value.value.height,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(value.value.circularRadius * 1.0),
                color: value.value.color),
          );
        },
      ),
    );
  }
}
