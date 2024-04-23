import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final int maxLine;
  const SmallText({
    super.key,
    required this.text,
    this.fontColor = Colors.black,
    this.fontSize = 12, this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
