import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  const BigText({
    super.key,
    required this.text,
    this.fontColor = Colors.black,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
