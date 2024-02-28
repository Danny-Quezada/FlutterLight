import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drag_drop/providers/style_provider.dart';
import 'package:flutter_drag_drop/ui/enum/widget_enum.dart';
import 'package:flutter_drag_drop/ui/utils/validator.dart';
import 'package:flutter_drag_drop/ui/widgets/secondary/color_palette_widget.dart';
import 'package:provider/provider.dart';
import 'package:text_style_editor/text_style_editor.dart';

class PropertyWidget extends StatelessWidget {
  PropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context, listen: false);
    return Container(
      color: Colors.white60,
      child: SingleChildScrollView(child: Consumer<StyleProvider>(
        builder: (context, value, child) {
          if (value.enumWidget == EnumWidget.text) {
            return TextStyleEditorWidget();
          }
          if (value.enumWidget == EnumWidget.container) {
            return BoxDecorationEditorWidget();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.ads_click),
                Text("Double tap in components")
              ],
            ),
          );
        },
      )),
    );
  }
}

class BoxDecorationEditorWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BoxDecorationEditorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w800);
    final styleProvider = Provider.of<StyleProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Editor container",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        Divider(),
        Text(
          "Color: ",
          style: textStyle,
        ),
        Divider(),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          child: ColorPalette(
              onColorPicked: (color) {
                styleProvider.boxDecorationProvider.color = color;
              },
              colors: paletteColors),
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(),
        const SizedBox(
          height: 15,
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  initialValue: styleProvider
                      .boxDecorationProvider.circularRadius
                      .toString(),
                  onChanged: (value) {
                    styleProvider.boxDecorationProvider.circularRadius =
                        int.parse(value == "" ? "0" : value);
                  },
                  maxLength: 2,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]|[1-2][0-9]|30')),
                    // for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: ValidarTextField.genericNumberValidator,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Radius ",
                      labelText: "Radius",
                      icon: Icon(Icons.radio_button_unchecked_sharp),
                      helperMaxLines: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    styleProvider.boxDecorationProvider.width =
                        double.parse(value == "" ? "0" : value);
                  },
                  maxLength: 3,
                  initialValue:
                      styleProvider.boxDecorationProvider.width.toString(),
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]|[1-2][0-9]|30')),
                    // for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    final intNumber = int.tryParse(value!);
                    if (intNumber != null && intNumber <= 10) {
                      return null;
                    }
                    return 'Ingrese el numero';
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Width",
                      labelText: "Width",
                      icon: Icon(Icons.width_normal),
                      helperMaxLines: 2),
                ),
                TextFormField(
                  initialValue:
                      styleProvider.boxDecorationProvider.height.toString(),
                  onChanged: (value) {
                    styleProvider.boxDecorationProvider.height =
                        double.parse(value == "" ? "0" : value);
                  },
                  maxLength: 3,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]|[1-2][0-9]|30')),
                    // for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: ValidarTextField.genericNumberValidator,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Heigth",
                      labelText: "Height",
                      icon: Icon(Icons.height),
                      helperMaxLines: 2),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TextStyleEditorWidget extends StatelessWidget {
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];

  TextStyle textStyle = TextStyle();
  TextAlign textAlign = TextAlign.left;
  TextStyleEditorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context, listen: false);
    return Column(
      children: [
        IntrinsicHeight(
            child: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: TextStyleEditor(
              fonts: fonts,
              paletteColors: paletteColors,
              textStyle: textStyle,
              textAlign: textAlign,
              initialTool: EditorToolbarAction.fontFamilyTool,
              onTextAlignEdited: (align) {
                // setState(() {
                //   textAlign = align;
                // });
                styleProvider.changeAlign(align);
              },
              onTextStyleEdited: (style) {
                styleProvider.changeStyle(style);
              },
              onCpasLockTaggle: (caps) {
                print(caps);
              },
            ),
          ),
        )),
      ],
    );
  }
}

List<Color> paletteColors = [
  Colors.black,
  Colors.white,
  Color(int.parse('0xffEA2027')),
  Color(int.parse('0xff006266')),
  Color(int.parse('0xff1B1464')),
  Color(int.parse('0xff5758BB')),
  Color(int.parse('0xff6F1E51')),
  Color(int.parse('0xffB53471')),
  Color(int.parse('0xffEE5A24')),
  Color(int.parse('0xff009432')),
  Color(int.parse('0xff0652DD')),
  Color(int.parse('0xff9980FA')),
  Color(int.parse('0xff833471')),
  Color(int.parse('0xff112CBC4')),
  Color(int.parse('0xffFDA7DF')),
  Color(int.parse('0xffED4C67')),
  Color(int.parse('0xffF79F1F')),
  Color(int.parse('0xffA3CB38')),
  Color(int.parse('0xff1289A7')),
  Color(int.parse('0xffD980FA'))
];
