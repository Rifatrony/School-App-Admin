import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/text/bold_text.dart';
import '../../../../widget/text/small_text.dart';

class StudentPersonalInfo extends StatelessWidget {

  final String title;
  final String value;

  const StudentPersonalInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoldText(
            text: title,
            fontSize: 12.sp,
          ),
          SmallText(
            text: value,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}
