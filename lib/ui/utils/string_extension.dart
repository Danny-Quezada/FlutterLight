extension StringExtensions on String{


  bool isValidEmail(){
    return RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(this);
  }
  bool isWhitespace()=>this.trim().isEmpty;

  bool isValidPassword()=>this.length>5;
}