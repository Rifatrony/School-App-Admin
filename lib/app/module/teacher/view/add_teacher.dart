import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/module/teacher/controller/teacher_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/button/custom_button.dart';
import 'package:srmm/app/widget/text_form/custom_text_form.dart';

class AddTeacherView extends StatelessWidget {
  const AddTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Add Teacher"),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextForm(
              controller: controller.nameController,
              hintText: AppConstant.teacherName,
            ),

            SizedBox(height: 5.h,),

            CustomTextForm(
              controller: controller.nidController,
              hintText: AppConstant.teacherNid,
              keyBoardType: TextInputType.number,
            ),

            SizedBox(height: 5.h,),

            CustomTextForm(
              controller: controller.numberController,
              hintText: AppConstant.teacherNumber,
              keyBoardType: TextInputType.phone,
            ),

            SizedBox(height: 5.h,),

            CustomTextForm(
              controller: controller.addressController,
              hintText: AppConstant.teacherAddress,
              keyBoardType: TextInputType.text,
            ),

            SizedBox(height: 15.h,),

            CustomButton(
              onPress: (){},
              title: "Submit",
              isLoading: false,
            ),

          ],
        ),
      ),
    );
  }
}
