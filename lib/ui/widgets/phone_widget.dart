import 'package:flutter/material.dart';

import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneWidget extends StatelessWidget {
  PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xfff4f8fc),
        child: Center(
            child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/svg/phone.svg",
              height: 627,
              width: 299.74,
            ),
            Positioned(
              top: 28,
              left: 9.80,
              child: ContainerPhone(),
            )
          ],
        )));
  }
}

class ContainerPhone extends StatefulWidget {
  ContainerPhone({
    super.key,
  });

  @override
  State<ContainerPhone> createState() => _ContainerPhoneState();
}

class _ContainerPhoneState extends State<ContainerPhone> {
  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context, listen: false);
    return Container(
      child: Scaffold(
        body: DragTarget<Object>(
          onAccept: (data) {
            if (data is EnumWidget) {
              phoneProvider.changeValue(
                DataWidget(
                  enumWidget: data as EnumWidget,
                  key: UniqueKey(),
                ),
              );
            } else {
              Map<String, Object> map = (data as Map<String, Object>);
              phoneProvider.changeValue(
                DataWidget.copy(
                  data["data"] as DataWidget,
                ),
              );
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Consumer<PhoneProvider>(
              builder: (context, value, child) {
                return ReorderableListView(
                  buildDefaultDragHandles: true,
                  children: List.generate(
                    value.widgets.length,
                    (index) => KeyedSubtree.wrap(value.widgets[index], index),
                  ),
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    DataWidget widget =
                        phoneProvider.widgets.removeAt(oldIndex);
                    phoneProvider.changeValueIndex(widget, newIndex);
                  },
                );
              },
            );
          },
        ),
      ),
      width: 278.74,
      height: 576,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
    );
  }
}
