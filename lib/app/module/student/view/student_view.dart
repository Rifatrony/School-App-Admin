import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/classes/controller/class_controller.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
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

          IconButton(
            onPressed: (){
              bottomSheet(context, controller, classController);
            },
            icon: Icon(Icons.filter_alt_outlined,),
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
                              Get.toNamed(RouteName.viewStudentDetails, arguments: {'id': student.studentId});
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
                                  const CircleAvatar(
                                    radius: 30,
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: student.name.toString()),
                                      Text("ID ${student.studentId}"),
                                      Text("Class ${student.classId}"),
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

      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange
        ),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){
              Get.toNamed(RouteName.addStudent);
            },
            child: Icon(
              Icons.add,
            ),
          ),
        )
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context, StudentController studentController, ClassController classController) {
    Data? selectedClass = classController.classList.isNotEmpty ? classController.classList[0] : null; // Initialize with first class, or null if empty
    String? selectedClassId;

    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context,) {
        return Container(
          padding: EdgeInsets.all(0.sp),
          height: 350,
          width: double.maxFinite,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  print("Click");
                },
                child: Container(
                  height: 4.h,
                  width: 40.w,
                  margin: EdgeInsets.only(top: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              BoldText(text: "Filter Student",),
              SizedBox(height: 10,),
              Divider(),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h, ),
                child: Center(
                  child: Row(
                    children: [
                      BoldText(text: "Selected Year"),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Obx(() => DropdownButton<int>(
                            value: studentController.selectedYear.value,
                            onChanged: (int? year) {
                              studentController.updateSelectedYear(year!);
                            },
                            underline: Container(),
                            items: studentController.years.map((int year) {
                              return DropdownMenuItem<int>(
                                value: year,
                                child: Text('$year'),
                              );
                            }).toList(),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h, ),
                child: Center(
                  child: Row(
                    children: [
                      BoldText(text: "Selected Class"),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  ),
                                ),
                                items: classController.isLoading.value
                                    ? [const DropdownMenuItem(value: 'Loading...', child: CircularProgressIndicator())]
                                    : classController.classList.isEmpty
                                    ? [const DropdownMenuItem(value: 'No Data Found', child: Text('No data found'))]
                                    : classController.classList.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.id.toString(),
                                    child: Text(item.name ?? ''),
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
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  print("Selected ID ${classController.selectedClassId.value }");
                  studentController.fetchStudent(); // Fetch student data for the selected year
                },
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h,),
                  decoration: BoxDecoration(
                    color: AppColor.buttonColor1,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: BoldText(
                      text: "Search",
                      fontColor: AppColor.whiteText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
