import 'package:flutter_drag_drop/ui/utils/string_extension.dart';

class ValidarTextField{
  
  static String? genericNumberValidator(String? s) {
    if (s == null || s.isWhitespace()) {
      return "Campo requerido";
    } else if (int.tryParse(s) != null) {
      int? value = int.tryParse(s);
      if (value! < 0) {
        return "No puede ser menor que 0";
      }
    } else {
      return "Campo debe de ser un número entero";
    }
  }
}