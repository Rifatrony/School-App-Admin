import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final bool isLoading;
  Color? buttonColor;
  int? height;
  final double width;

  CustomButton({
    super.key,
    required this.onPress,
    required this.title,
    required this.isLoading,
    this.buttonColor = Colors.white,
    this.width = double.maxFinite,
    this.height = 40
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: buttonColor,
      ),
      child: isLoading ? CircularProgressIndicator() : Center(child: Text(title,)),
    );
  }
}
