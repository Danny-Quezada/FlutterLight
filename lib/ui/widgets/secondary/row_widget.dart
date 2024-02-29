import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/container_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/data_widget.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/tool_widget.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class RowWidget extends StatelessWidget {
  PhoneProvider? provider;
  RowWidget({required this.provider});
RowWidget.copy(RowWidget rowWidget){
    this.provider=PhoneProvider();
    this.provider!.widgets= rowWidget.provider!.widgets.map((widget) { 
     
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
              if(data is EnumWidget){
              provider.changeValue(
               
                 
                   DataWidget(enumWidget: data,),
                
              );
              }
              else{
                provider.changeValue(data as DataWidget);
              }

            },
            builder: (context, candidateData, rejectedData) {
              return
                 IntrinsicHeight(child: provider.widgets.isEmpty ? Container(
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
                            DataWidget widget = provider.widgets.removeAt(oldIndex);
                            provider.changeValueIndex(widget, newIndex);
                          },
                          scrollController: ScrollController(),
                          children: List.generate(provider.widgets.length, (index) => KeyedSubtree.wrap(provider.widgets[index],index)),
                        ),
                      ),
                    )
                 );
            },
          );
        },
      ),
    );
  }
}
