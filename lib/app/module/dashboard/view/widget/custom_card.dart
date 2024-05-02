import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class CustomCard extends StatelessWidget {

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCard({super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color ?? AppColor.cardBackgroundColor,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
