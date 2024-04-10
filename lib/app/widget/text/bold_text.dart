import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  const BoldText({
    super.key,
    required this.text,
    this.fontColor = Colors.black,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
