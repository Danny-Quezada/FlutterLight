import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/ui_provider.dart';
import 'package:flutter_drag_drop/ui/widgets/phone_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/property_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/tools_widget.dart';
import 'package:provider/provider.dart';
import 'package:multi_split_view/multi_split_view.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    MultiSplitView multiSplitView = MultiSplitView(
      initialAreas: [
        Area(
          weight: uiProvider.toolsWidth,
          minimalWeight: uiProvider.toolsWidth,
        ),
        Area(
          minimalSize: 299.74,
        ),
        Area(
          weight: uiProvider.propertyWidth,
          minimalWeight: uiProvider.propertyWidth,
        ),
      ],
      children: [ToolsWidget(), PhoneWidget(), PropertyWidget()],
    );

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerThickness: 4,
            dividerPainter: DividerPainters.grooved1(
                backgroundColor: Colors.grey.shade300,
                color: Colors.indigo[100]!,
                highlightedColor: Colors.indigo[900]!)),
        child: multiSplitView);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: size.width < 600
            ? const Center(
                child: Text("Size is so small 😢"),
              )
            : theme);
  }
}
