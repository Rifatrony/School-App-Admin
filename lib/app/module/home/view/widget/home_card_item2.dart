import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';
import '../../../../widget/text/big_text.dart';
import '../../../../widget/text/bold_text.dart';

class HomeItemCard2 extends StatelessWidget {

  final VoidCallback onPress;
  final String title;
  final String image;
  final Color? cardColor;

  const HomeItemCard2({
    super.key, required this.title, required this.image, required this.onPress, this.cardColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(
                image: AssetImage(
                  image,
                ),
                height: 30.h,
                width: 30.h,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 4.h,),

              BigText(
                text: title,
                fontColor: AppColor.blackText,
                fontSize: 12.sp,
              ),

            ],
          ),
        ),
      ),
    );
  }
}