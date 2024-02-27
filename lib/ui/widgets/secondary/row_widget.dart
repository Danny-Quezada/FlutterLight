import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class RowWidget extends StatelessWidget {
  final PhoneProvider provider;
  RowWidget({super.key, required this.provider});

  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<PhoneProvider>(
        builder: (context, provider, _) {
          return DragTarget<EnumWidget>(
            onAccept: (data) {
              provider.changeValue(
                KeyedSubtree(
                  child: DataWidget(enumWidget: data),
                  key: Key(uuid.v4()),
                ),
              );
            },
            builder: (context, candidateData, rejectedData) {
              return provider.widgets.isEmpty
                  ? Container(
                      child: Text("Row is empty"),
                    )
                  : SizedBox(
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: ReorderableRow(
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            Widget widget = provider.widgets.removeAt(oldIndex);
                            provider.changeValueIndex(widget, newIndex);
                          },
                          scrollController: ScrollController(),
                          children: provider.widgets,
                        ),
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
