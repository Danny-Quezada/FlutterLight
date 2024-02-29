import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class ColumnWidget extends StatelessWidget {
  PhoneProvider? provider;
  ColumnWidget({required this.provider});

  ColumnWidget.copy(ColumnWidget columnWidget) {
    this.provider = PhoneProvider();
    this.provider!.widgets = columnWidget.provider!.widgets.map((widget) {
      return DataWidget.copy(widget);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<PhoneProvider>(
        builder: (context, provider, _) {
          return DragTarget<Object>(
            onAccept: (data) {
              if (data is EnumWidget) {
                provider.changeValue(
                  DataWidget(enumWidget: data),
                );
              } else {
                provider.changeValue(data as DataWidget);
              }
            },
            builder: (context, candidateData, rejectedData) {
              return IntrinsicHeight(
                  child: provider.widgets.isEmpty
                      ? Container(
                          child: Text("column is empty"),
                        )
                      : SizedBox(
                          height: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ReorderableColumn(
                              onReorder: (oldIndex, newIndex) {
                                if (oldIndex < newIndex) {
                                  newIndex -= 1;
                                }
                                DataWidget widget =
                                    provider.widgets.removeAt(oldIndex);
                                provider.changeValueIndex(widget, newIndex);
                              },
                              children: List.generate(
                                  provider.widgets.length,
                                  (index) => KeyedSubtree.wrap(
                                      provider.widgets[index], index)),
                              scrollController: ScrollController(),
                            ),
                          ),
                        ));
            },
          );
        },
      ),
    );
  }
}
