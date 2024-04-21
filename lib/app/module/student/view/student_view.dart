import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/module/classes/controller/class_controller.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/utils/custom_message.dart';
import 'package:srmm/app/widget/text/big_text.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

import '../../../route/routes.dart';
import '../../classes/model/class_model.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(StudentController());
    final classController = Get.put(ClassController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("All Student"),
        surfaceTintColor: Colors.transparent,
        actions: [

          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.search),
          ),


        ],
      ),
      body: Column(
        children: [

          Container(
            height: 60,
            child: Row(
              children: [
                Container(
                  // color: Colors.red,
                  // width: double.maxFinite,
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  child: Center(
                    child: Row(
                      children: [
                        BoldText(text: "Select\nYear", fontSize: 12,),
                        SizedBox(width: 4.h,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Obx(() => DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: controller.selectedYear.value,
                              onChanged: (int? year) {
                                controller.updateSelectedYear(year!);
                                controller.fetchStudent();
                              },
                              underline: Container(),
                              items: controller.years.map((int year) {
                                return DropdownMenuItem<int>(
                                  value: year,
                                  child: Text(
                                    '$year',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    // width: double.maxFinite,
                    padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                    child: Center(
                      child: Row(
                        children: [
                          BoldText(text: "Select\nClass", fontSize: 12,),
                          SizedBox(width: 4.w,),
                          Expanded(
                            child: Container(
                              // width: double.infinity,
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
                                      classController.selectedClassId.value = newValue; // Parse selected value to int
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),

          Expanded(
            child: Obx(()=> controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : controller.studentList.isEmpty
                    ? Center(child: Text("No Data found"))
                    : ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 50.h),
                        itemCount: controller.studentList.length,
                        itemBuilder: (context, index){
                          final student = controller.studentList[index];
                          return GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteName.viewStudentDetails, arguments: {'id': student.id});
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h,),
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(AppImage.studentIcon,),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: student.name.toString()),
                                      Text("ID ${student.id}"),
                                      Text("Class ${student.studentClass?.name}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                       },
                    ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Get.toNamed(RouteName.addStudent);
          CustomMessage.successToast("Success");
        },
        child: Icon(
          Icons.add,
        ),
        shape: CircleBorder(),
      ),
    );
  }

}
