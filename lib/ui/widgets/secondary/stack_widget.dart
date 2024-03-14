import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:provider/provider.dart';

class StackWidget extends StatelessWidget {
  PhoneProvider? provider;
  StackWidget({required this.provider});

  StackWidget.copy(StackWidget stackWidget) {
    this.boxDecorationProvider.width = stackWidget.boxDecorationProvider.width;
    this.boxDecorationProvider.height =
        stackWidget.boxDecorationProvider.height;
    this.provider = PhoneProvider();
    this.provider!.widgets = stackWidget.provider!.widgets.map((widget) {
      return DataWidget.copy(widget);
    }).toList();
  }
  GlobalKey _dragTargetKey = GlobalKey();

  double x = 50;
  double y = 50;
  BoxDecorationProvider boxDecorationProvider = BoxDecorationProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<PhoneProvider>(
        builder: (context, provider, _) {
          return DragTarget<Object>(
            key: _dragTargetKey,
            onAcceptWithDetails: (details) {
              //           final RelativeRect position = RelativeRect.fromRect(
              //   Rect.fromPoints(details.offset, details.offset),
              //   Offset.zero & overlay.size,
              // );

              // x = position.left;
              // y = position.top;

              // print(x.toString() + " " + y.toString());
                 Offset globalPosition = details.offset;

                  // Obtiene la posición local dentro del DragTarget

                  RenderBox renderBox = _dragTargetKey.currentContext!
                      .findRenderObject() as RenderBox;
                  Offset localPosition =
                      renderBox.globalToLocal(globalPosition);

                  // Utiliza la posición local según sea necesario
                  print('Posición local en el DragTarget: $localPosition');
              if (details.data is EnumWidget) {
                provider.changeValue(
                  DataWidget(
                      enumWidget: details.data as EnumWidget,
                      x: localPosition.dx,
                      y: localPosition.dy),
                );
              } else {
                provider.changeValue(details.data as DataWidget);
              }
            },
            builder: (context, candidateData, rejectedData) {
              return IntrinsicHeight(
                  child:
                      //provider.widgets.isEmpty
                      // ? SizedBox(
                      //     height: this.boxDecorationProvider.width,
                      //     width: this.boxDecorationProvider.height,
                      //     child: Center(child: const Text("Stack is empty")))
                      //:
                      SizedBox(
                height: this.boxDecorationProvider.width,
                width: this.boxDecorationProvider.height,
                child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Stack(children: provider.widgets)),
              ));
            },
          );
        },
      ),
    );
  }
}
