import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final bool isLoading;
  Color? buttonColor;
  double? height;
  double? width;

  CustomButton({
    super.key,
    required this.onPress,
    required this.title,
    required this.isLoading,
    this.buttonColor = Colors.white,
    this.width = 100,
    this.height = 40
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: buttonColor,
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SmallText(
                  text: title,
                  fontSize: 14.sp,
                  fontColor: AppColor.blackText,
                ),
              ),
      ),
    );
  }
}
