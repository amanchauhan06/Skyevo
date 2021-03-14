import 'package:flutter/material.dart';
import 'package:skyevo/UI/Utils/Colors/colors.dart';

Center progressIndicator() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(blackText),
    ),
  );
}
