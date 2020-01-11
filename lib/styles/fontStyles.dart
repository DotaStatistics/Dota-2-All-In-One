import "package:flutter/material.dart";

class FontStyles {
  static TextStyle redText(){
    return TextStyle (
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle greenText(){
    return TextStyle (
      color: Colors.green,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle yellowText(){
    return TextStyle (
      color: Colors.yellowAccent,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle whiteText(){
    return TextStyle (
      color: Colors.white70,
    );
  }

  static TextStyle whiteTextBold(){
    return TextStyle (
      color: Colors.white70,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle whiteTextHeader(){
    return TextStyle (
      color: Colors.white70,
      fontSize: 22.0
    );
  }

  static TextStyle appBarMatchDetails(){
    return TextStyle (
        color: Colors.white70,
        fontSize: 15.0
    );
  }

  static TextStyle win(){
    return TextStyle(
      color: Colors.green,
      fontSize: 22.0,
    );
  }
  static TextStyle loss(){
    return TextStyle(
      color: Colors.redAccent,
      fontSize: 22.0,
    );
  }

}