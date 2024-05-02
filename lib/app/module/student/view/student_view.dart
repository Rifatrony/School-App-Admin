import 'dart:developer';

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

    // onRefresh() async {
    //   await Future.delayed(
    //     Duration(milliseconds: 1000), (){
    //       controller.fetchStudent();
    //       classController.fetchClass();
    //       classController.selectedIndex.value = 0;
    //     },
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [

          SizedBox(height: 18.h,),

          Row(
            children: [
              
              InkWell(
                onTap: (){},
                child: Container(
                  // margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.green
                  ),
                  child: Text("Add New"),
                ),
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.cardBackgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    hintText: "Search by ID and Name",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              SizedBox(width: 10.w,),
              
              Text("Filter:"),

              SizedBox(width: 5.w,),

              Container(
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                margin: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Obx(() => DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: controller.selectedYear.value,
                    dropdownColor: Colors.black45,
                    focusColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 12),
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
                            fontSize: 13,
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



          SizedBox(height: 10.h,),

          SizedBox(
            height: 30,
            child: Obx(() => classController.isLoading.value
                ? SizedBox(height: 30.h,)
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: classController.classList.length + 1,
              // Add 1 for the "All" option
              itemBuilder: (context, index) {
                final isSelected = classController.selectedIndex.value == index;
                final isAll = index == 0;
                final classIndex = isAll ? -1 : index - 1;
                final className =
                isAll ? "All Student" : "Class ${classController.classList[classIndex].name ?? ""}";

                return GestureDetector(
                  onTap: () {
                    classController.setSelectedIndex(index);
                    classController.setClass(isAll ? 1 : classIndex);
                    classController.filterClassId.value = (isAll? "1" : classController.classList[classIndex].id)!;
                    print("Filter Class ID : ${classController.filterClassId.value}");
                    controller.fetchStudent();
                  },
                  child: Obx(()=>
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        margin: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                          color: classController.selectedIndex.value == index
                              ? Colors.green
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            className,
                            style: TextStyle(
                              color: classController.selectedIndex.value == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ),
                );
              },
            ),
            ),
          ),

          SizedBox(height: 10.h,),
      Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(), // Show loading indicator while data is being fetched
          );
        } else {
          return Container(
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Add border around the container
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Allow horizontal scrolling if needed
              child: SingleChildScrollView(
                child: DataTable(
                  sortAscending: controller.sortAscending.value,
                  sortColumnIndex: controller.sortColumnIndex.value,
                  columns: [
                    DataColumn(
                      label: Text('Image'),
                    ),
                    DataColumn(
                      label: Text('ID'),
                      onSort: (columnIndex, ascending) {
                        controller.sortStudentsBy('id', ascending);
                      },
                    ),
                    DataColumn(
                      label: Text('Roll No'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                      onSort: (columnIndex, ascending) {
                        controller.sortStudentsBy('name', ascending);
                      },
                    ),
                    DataColumn(
                      label: Text('Age'),
                      onSort: (columnIndex, ascending) {
                        controller.sortStudentsBy('age', ascending);
                      },
                    ),
                    DataColumn(
                      label: Text('Class'),
                    ),
                    DataColumn(
                      label: Text('Department'),
                    ),
                    DataColumn(
                      label: Text('Section'),
                    ),

                    // DataColumn(
                    //   label: Text('Father Name'),
                    // ),

                    DataColumn(
                      label: Text('Phone'),
                    ),


                    // DataColumn(
                    //   label: Text('Address'),
                    // ),

                    DataColumn(
                      label: Text('Year'),
                    ),

                    DataColumn(
                      label: Text('Action'),
                    ),
                    // Add more columns if needed
                  ],
                  rows: controller.studentList.map((student) {
                    return DataRow(cells: [
                      DataCell(CircleAvatar()),
                      DataCell(Text(student.id ?? 'N/A')),
                      DataCell(Text(student.rollNo?.toString() ?? 'N/A')),
                      DataCell(Text(student.name ?? 'N/A')),
                      DataCell(Text(student.age?.toString() ?? 'N/A')),
                      DataCell(Text(student.studentClass?.name ?? 'N/A')),
                      DataCell(Text(student.department?.name ?? 'N/A')),
                      DataCell(Text(student.section?.name ?? 'N/A')),
                      // DataCell(Text(student.fName ?? 'N/A')),
                      DataCell(Text(student.number.toString() ?? 'N/A')),
                      // DataCell(Text(student.address ?? 'N/A')),
                      DataCell(Text(student.currentEnrollYear ?? 'N/A')),
                      DataCell(
                        Row(
                          children: [
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.blue,
                                ),
                                child: Text("Edit"),
                              ),
                            ),

                            SizedBox(width: 8,),

                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.redAccent,
                                ),
                                child: Text("Delete"),
                              ),
                            ),




                          ],
                        )
                      ),
                      // Add more cells for additional fields
                    ]);
                  }).toList(),
                ),
              ),
            ),
          );
        }
      }),
        ],
      ),
    );
  }

}
