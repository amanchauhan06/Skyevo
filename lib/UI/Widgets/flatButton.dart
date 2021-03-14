import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Styles/textStyle.dart';

Padding flatButton(BuildContext context, String text, dynamic onPress, color) {
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Text(
          '$text',
          style: h5WhiteText,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: color,
    ),
  );
}
