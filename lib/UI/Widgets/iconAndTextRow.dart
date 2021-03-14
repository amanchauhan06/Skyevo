import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';

Row iconAndTextRow(icon, text) {
  return Row(
    children: [
      Icon(
        icon,
        color: greyText,
      ),
      SizedBox(
        width: 10,
      ),
      Flexible(
          child: Text(
        '$text',
        style: h5GreyText,
      ))
    ],
  );
}
