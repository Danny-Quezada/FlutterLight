import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/tool_provider.dart';
import 'package:flutter_drag_drop/providers/ui_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';

import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatelessWidget {
  String titleName;
  TitleWidget({required this.titleName});

  @override
  Widget build(BuildContext context) {
    const textStyleTitles = TextStyle(
        color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w800);
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            titleName,
            style: textStyleTitles,
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ToolsWidget extends StatelessWidget {
  ToolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final toolProvider = Provider.of<ToolProvider>(context, listen: false);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        color: Colors.white60,
        child: CustomScrollView(
          slivers: [
            TitleWidget(titleName: "Layouts"),
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                ),
                delegate: SliverChildListDelegate([
                  ToolWidget(
                    enumWidget: EnumWidget.column,
                  ),
                  ToolWidget(
                    enumWidget: EnumWidget.row,
                  ),
                  ToolWidget(enumWidget: EnumWidget.stack)
                ])),
            TitleWidget(titleName: "Components"),
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                ),
                delegate: SliverChildListDelegate([
                  ToolWidget(
                    enumWidget: EnumWidget.text,
                  ),
                  ToolWidget(
                    enumWidget: EnumWidget.container,
                  ),
                ])),
            TitleWidget(titleName: "Created component"),
            Consumer<ToolProvider>(
              builder: (context, value, child) {
                if (toolProvider.toolWidgets.isNotEmpty) {
                  return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          childCount: toolProvider.toolWidgets.length,
                          (context, index) {
                        return toolProvider.toolWidgets[index];
                      }));
                }
                return const SliverToBoxAdapter();
              },
            )
          ],
        ));
  }
}
