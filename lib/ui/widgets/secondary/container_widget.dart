import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key});

  BoxDecorationProvider value = BoxDecorationProvider();

  ContainerWidget.copy(ContainerWidget container) {
    this.value.circularRadius = container.value.circularRadius;
    this.value.color = container.value.color;
    this.value.height = container.value.height;
    this.value.width = container.value.width;
    // this.value=container.value;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: value.width,
        height: value.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(value.circularRadius * 1.0),
            color: value.color),
      ),
    );
  }
}
