import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:multi_split_view/multi_split_view.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    MultiSplitView multiSplitView = MultiSplitView(
      children: [ToolsWidget(), PhoneWidget(), PropertyWidget()],
      initialAreas: [
        Area(
          weight: uiProvider.toolsWidth,
          minimalWeight: uiProvider.toolsWidth,
        ),
        Area(),
        Area(
          weight: uiProvider.propertyWidth,
          minimalWeight: uiProvider.propertyWidth,
        ),
      ],
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
    return Scaffold(body: theme);
  }
}

class ToolsWidget extends StatelessWidget {
  ToolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    return Container(
      color: Colors.white60,
    );
  }
}

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
    );
  }
}

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
    );
  }
}

class LayoutWidgetContainer extends StatelessWidget {
  const LayoutWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Text("Layout");
          }
          return Container(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
