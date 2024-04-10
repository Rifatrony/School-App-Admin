import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/small_text.dart';
import 'package:srmm/app/widget/text_form/custom_text_form.dart';

import '../../../widget/button/custom_button.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(StudentController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("Add Student"),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(

          children: [

            /// Student Name

            SmallText(
              text: AppConstant.studentName,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.studentName,
            ),

            /// Class Select from drop down
            SmallText(
              text: AppConstant.className,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),

            /// Department Select from dropdown

            SmallText(
              text: AppConstant.department,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),


            /// Birth Certificate
            SmallText(
              text: AppConstant.birthCertificate,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.birthCertificate,
              keyBoardType: TextInputType.number,
            ),

            /// NID

            SmallText(
              text: AppConstant.nid,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.nid,
            ),

            /// Father Name

            SmallText(
              text: AppConstant.fatherName,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.fatherName,
            ),

            /// Mother Name

            SmallText(
              text: AppConstant.motherName,
              fontColor: Colors.grey.shade700,
            ),
            SizedBox(height: 4.h,),
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.motherName,
            ),

            SizedBox(height: 20.h,),

            CustomButton(
              isLoading: false,
              onPress: () {  },
              title: 'Submit',

            ),

          ],
        ),
      ),
    );
  }
}
