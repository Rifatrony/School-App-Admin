import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/student/view/widget/student_personal_into_widget.dart';

import '../../../../utils/app_color.dart';
import '../../../../widget/text/bold_text.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white.withOpacity(0.8),
      shadowColor: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(
                  text: "Personal Information",
                  fontSize: 13.sp,
                ),
                GestureDetector(
                  onTap: (){
                    Get.snackbar("Edit personaL INFO", "Open dialog");
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.card3,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 0.5.sp,
              color: Colors.grey.shade300,
            ),

            const StudentPersonalInfo(
              title: "Birth Certificate:",
              value: "12158561578451",
            ),

            const StudentPersonalInfo(title: "Father's Name: ", value: "Shoharab Hossain",),

            const StudentPersonalInfo(
              title: "Mother's Name: ",
              value: "Ruby Akter",
            ),

            const StudentPersonalInfo(
              title: "Father/ Mother Nid: ",
              value: "123456789",
            ),

            const StudentPersonalInfo(
              title: "Contact Number:",
              value: "0123456789",
            ),

            const StudentPersonalInfo(
              title: "Address:",
              value: "Mazukahn",
            ),

            const StudentPersonalInfo(
              title: "Admission Year:",
              value: "2022",
            ),



          ],
        ),
      ),
    );
  }
}
