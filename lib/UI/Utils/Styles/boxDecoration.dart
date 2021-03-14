
import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';

InputDecoration buildInputDecoration(
  String hintText,
) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: hintText,
    labelStyle: onBoardText,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: greyText, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: blackText, width: 1),
    ),
  );
}
