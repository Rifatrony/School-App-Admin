import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/big_text.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

import '../../../route/routes.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(StudentController());

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
              bottomSheet(context, controller);
            },
            icon: Icon(Icons.filter_alt_outlined,),
          ),

        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
              ListView.builder(
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

  Future<dynamic> bottomSheet(BuildContext context, StudentController controller) {
    return showModalBottomSheet(
              backgroundColor: Colors.white,
                context: context, builder: (BuildContext context,){
              return Container(
                padding: EdgeInsets.all(0.sp),
                height: 350,
                width: double.maxFinite,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
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
                      // color: Colors.red,
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
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Obx(() => DropdownButton<int>(
                                  value: controller.selectedYear.value,
                                  onChanged: (int? year) {
                                    controller.updateSelectedYear(year!);
                                  },
                                  underline: Container(),
                                  items: controller.years.map((int year) {
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

                    SizedBox(height: 10,),

                    Container(
                      width: double.maxFinite,
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h, ),
                      child: Center(
                        child: Row(
                          children: [
                            BoldText(text: "Selected Class"),
                            SizedBox(width: 10.w,),
                            SmallText(text: "One"),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
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
                )
              );
            });
  }
}
