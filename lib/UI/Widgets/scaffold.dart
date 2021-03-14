
import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';

showInSnackBar(context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      "$value",
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: h6WhiteText,
    ),
    duration: Duration(seconds: 3),
    backgroundColor: blackText,
  ));
}
