import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/globals/fontSizes.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  TextWidget({
    required this.text,
    this.style = const TextStyle(
      fontSize: mediumFontSize,
      fontWeight: FontWeight.normal,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
