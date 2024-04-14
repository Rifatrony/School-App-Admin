import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/small_text.dart';
import 'package:srmm/app/widget/text_form/custom_text_form.dart';

import '../../../widget/button/custom_button.dart';
import '../../classes/controller/class_controller.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(StudentController());
    final classController = Get.find<ClassController>();

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


            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: AppConstant.className,
                        fontColor: Colors.grey.shade700,
                      ),
                      SizedBox(height: 4.h,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                              () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: classController.selectedClass.value.isNotEmpty
                                  ? classController.selectedClass.value
                                  : null,
                              onChanged: (newValue) {
                                classController.selectedClass.value = newValue!;
                                print("New value is ================> ${classController.selectedClass.value}");
                                classController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                print('Selected Class ID: ${classController.selectedClassId.value}');
                              },
                              hint: Text(
                                'Select a Class',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              items: classController.isLoading.value
                                  ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                  : classController.classList.isEmpty
                                  ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                  : classController.classList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8.w,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: AppConstant.department,
                        fontColor: Colors.grey.shade700,
                      ),
                      SizedBox(height: 4.h,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                              () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: classController.selectedClass.value.isNotEmpty
                                  ? classController.selectedClass.value
                                  : null,
                              onChanged: (newValue) {
                                classController.selectedClass.value = newValue!;
                                print("New value is ================> ${classController.selectedClass.value}");
                                classController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                print('Selected Class ID: ${classController.selectedClassId.value}');
                              },
                              hint: Text(
                                'Select a Class',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              items: classController.isLoading.value
                                  ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                  : classController.classList.isEmpty
                                  ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                  : classController.classList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Section Drop down
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: AppConstant.sectionName,
                        fontColor: Colors.grey.shade700,
                      ),
                      SizedBox(height: 4.h,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                              () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: classController.selectedClass.value.isNotEmpty
                                  ? classController.selectedClass.value
                                  : null,
                              onChanged: (newValue) {
                                classController.selectedClass.value = newValue!;
                                print("New value is ================> ${classController.selectedClass.value}");
                                classController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                print('Selected Class ID: ${classController.selectedClassId.value}');
                              },
                              hint: Text(
                                'Select a Class',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              items: classController.isLoading.value
                                  ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                  : classController.classList.isEmpty
                                  ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                  : classController.classList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8.w,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: AppConstant.department,
                        fontColor: Colors.grey.shade700,
                      ),
                      SizedBox(height: 4.h,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(
                              () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: classController.selectedClass.value.isNotEmpty
                                  ? classController.selectedClass.value
                                  : null,
                              onChanged: (newValue) {
                                classController.selectedClass.value = newValue!;
                                print("New value is ================> ${classController.selectedClass.value}");
                                classController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                print('Selected Class ID: ${classController.selectedClassId.value}');
                              },
                              hint: Text(
                                'Select a Class',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              items: classController.isLoading.value
                                  ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                  : classController.classList.isEmpty
                                  ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                  : classController.classList.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// Department Select from dropdown

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
