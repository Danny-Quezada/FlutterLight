import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white60,
        child: Center(
          child: Container(
            child: DynamicWidgetBuilder.build('''
{
  
    "type": "Column",
    "children":[
      {
        "type": "Text",
        "data": "That's right"
      },
      {
        "type": "Container",
        "child":{
          "type": "Text",
          "data": "That's not right"
        }
      }
      

    ]
    
  }
''', context, DefaultClickListener()),
            width: 390,
            height: 590,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    // TODO: implement onClicked
  }
}
