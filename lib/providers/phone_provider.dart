import 'package:flutter/widgets.dart';

class PhoneProvider with ChangeNotifier{
  String value="";

  changeValue(String widget){
    value+=widget;
    notifyListeners();
  }
}