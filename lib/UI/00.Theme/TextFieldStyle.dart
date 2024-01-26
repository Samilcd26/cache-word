import 'package:flutter/material.dart';

class TextFieldStyle {
  static InputDecoration myInputDecoration(Widget? suffixIcon, String title) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      labelText: title,
      alignLabelWithHint: true,
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedBorder: _focusBorder(),
    );
  }

  static OutlineInputBorder _inputBorder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }

  static OutlineInputBorder _focusBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }
}
