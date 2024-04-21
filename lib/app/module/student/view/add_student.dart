import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/module/department/controller/department_controller.dart';
import 'package:srmm/app/module/section/controller/section_controller.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/small_text.dart';
import 'package:srmm/app/widget/text_form/custom_text_form.dart';

import '../../../widget/button/custom_button.dart';
import '../../../widget/text/bold_text.dart';
import '../../classes/controller/class_controller.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


    final controller = Get.put(StudentController());
    final classController = Get.find<ClassController>();
    final departmentController = Get.put(DepartmentController());
    final sectionController = Get.put(SectionController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("Add Student"),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: ListView(

            children: [

              Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 12.h),
                decoration: BoxDecoration(
                  color: AppColor.whiteText,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
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
                                height: 30.h,
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
                                        classController.selectedClassId.value = newValue;
                                        print('Selected Class ID============> ${classController.selectedClassId.value}');

                                        /// This is for call Section Dropdown based on Class ID
                                        sectionController.isLoading.value = true;
                                        sectionController.selectedSection.value = '';
                                        sectionController.fetchSection(classController.selectedClassId.value).then((_) {
                                          controller.isLoading.value = false;
                                        });
                                      },
                                      hint: Text(
                                        'Select Class',
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
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Obx(
                                      () => DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: departmentController.selectedDepartment.value.isNotEmpty
                                          ? departmentController.selectedDepartment.value
                                          : null,
                                      onChanged: (newValue) {
                                        departmentController.selectedDepartment.value = newValue!;
                                        // print("New value is ================> ${classController.selectedClass.value}");
                                        // departmentController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                        // print('Selected Class ID: ${departmentController.selectedClassId.value}');
                                      },
                                      hint: Text(
                                        'Select Dept.',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.normal,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      items: departmentController.isLoading.value
                                          ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                          : departmentController.departmentList.isEmpty
                                          ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                          : departmentController.departmentList.map((item) {
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

                    SizedBox(height: 10.h,),

                    /// Section Drop down
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(
                          text: AppConstant.sectionName,
                          fontColor: Colors.grey.shade700,
                        ),
                        SizedBox(width: 14.h,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 30.h,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Obx(
                                  () => DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: sectionController.selectedSection.value.isNotEmpty
                                      ? sectionController.selectedSection.value
                                      : null,
                                  onChanged: (newValue) {
                                    sectionController.selectedSection.value = newValue!;
                                    print("New value is ================> ${sectionController.selectedSection.value}");
                                    // sectionController.selectedClassId.value = int.tryParse(newValue) ?? -1; // Parse selected value to int
                                    // print('Selected Class ID: ${sectionController.selectedClassId.value}');
                                  },
                                  hint: Text(
                                    'Select Section',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  items: sectionController.isLoading.value
                                      ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                      : sectionController.sectionList.isEmpty
                                      ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                      : sectionController.sectionList.map((item) {
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 14.h,),

              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.whiteText
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        SmallText(text: AppConstant.studentName),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: CustomTextForm(
                            controller: controller.nameController,
                            hintText: AppConstant.studentName,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter a name';
                            //   }
                            //   return null; // Return null if the input is valid
                            // },
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 8.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            controller: controller.birthController,
                            hintText: AppConstant.birthCertificate,
                            keyBoardType: TextInputType.number,
                          ),
                        ),

                        SizedBox(width: 8.w,),

                        Expanded(
                          child: CustomTextForm(
                            controller: controller.ageController,
                            hintText: AppConstant.age,
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h,),

                    Row(
                      children: [

                        Flexible(
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: Obx(() => RadioListTile<int>(
                              title: SmallText(text: "Male"),
                              value: 1,
                              groupValue: controller.selectedValue.value,
                              onChanged: (value) {
                                controller.updateSelectedValue(value!);
                              },
                            )),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: Obx(() => RadioListTile<int>(
                              title: SmallText(text: "Female"),
                              value: 2,
                              groupValue: controller.selectedValue.value,
                              onChanged: (value) {
                                controller.updateSelectedValue(value!);
                              },
                            )),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 8.h,),

              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.whiteText
                ),
                child: Column(
                  children: [

                    BoldText(text: "Parents Info..."),
                    SizedBox(height: 8.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            controller: controller.fatherNameController,
                            hintText: AppConstant.fatherName,
                          ),
                        ),

                        SizedBox(width: 8.w,),

                        Expanded(
                          child: CustomTextForm(
                            controller: controller.motherNameController,
                            hintText: AppConstant.motherName,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            controller: controller.numberController,
                            hintText: AppConstant.number,
                            keyBoardType: TextInputType.number,
                          ),
                        ),

                        SizedBox(width: 8.w,),

                        Expanded(
                          child: CustomTextForm(
                            controller: controller.nidController,
                            hintText: AppConstant.nid,
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8.h,),

              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.whiteText
                ),
                child: Column(
                  children: [

                    // Row(
                    //   children: [
                    //     SmallText(text: AppConstant.date),
                    //     SizedBox(width: 8.w,),
                    //     Expanded(
                    //       child: CustomTextForm(
                    //         controller: controller.nameController,
                    //         hintText: AppConstant.date,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //
                    // SizedBox(height: 8.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextForm(
                            isReadOnly: true,
                            controller: controller.dateController,
                            hintText: AppConstant.date,
                            suffixIcon: Icons.calendar_month,
                            onPressSuffix: (){
                              controller.selectDate(context);
                            },
                          ),
                        ),

                        SizedBox(width: 8.w,),

                        Expanded(
                          child: CustomTextForm(
                            controller: controller.addressController,
                            hintText: AppConstant.address,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h,),

              Obx(()=>
                CustomButton(
                  isLoading: controller.isAddStudentLoading.value,
                  height: 35.h,
                  buttonColor: AppColor.buttonColor2,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      // All form fields are valid, proceed with submission...
                      controller.addStudent();
                    } else {
                      print("Required Data");
                    }
                  },
                  title: 'Submit',

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
