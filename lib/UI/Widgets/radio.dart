
import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';

class RadioButton extends StatelessWidget {
  final dynamic value, groupValue;
  final Function onChanged;

  const RadioButton(this.value, this.groupValue, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Radio(

      activeColor: blackText,
      focusColor: blackText,
      hoverColor: blackText,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}