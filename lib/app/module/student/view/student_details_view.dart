import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';
import 'package:srmm/app/module/student/view/widget/personal_info_card.dart';
import 'package:srmm/app/module/student/view/widget/student_personal_into_widget.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/button/custom_button.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<StudentController>();

    final Map<String, dynamic> args = Get.arguments;
    final String id = args['id'];
    final int index = args['index'];

    print("Received ID is ==============> $id");
    print("Received INDEX is ==============> $index");

    final studentDetails = controller.studentList[index];

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Text("Student Details"),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Card(
                surfaceTintColor: Colors.white.withOpacity(0.5),
                shadowColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),

                ),
                child: Container(
                  // height: 250,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: AssetImage(AppImage.studentIcon),
                      ),
                      SizedBox(width: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(
                            text: AppConstant.studentName,
                            fontSize: 12.sp,
                          ),
                          SizedBox(height: 4.h,),
                          SmallText(text: "ID: $id"),
                          SizedBox(height: 4.h,),
                          SmallText(text: "Roll No: ${studentDetails.rollNo}"),
                          SizedBox(height: 4.h,),
                          SmallText(text: "Class: ${studentDetails.studentClass?.name ?? ""}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16.h,),

              Container(
                height: 40.h,
                padding: const EdgeInsets.all(6),
                margin: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TabBar(
                  labelColor: AppColor.blackText,
                  labelStyle: TextStyle(
                      fontSize: 12.sp
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Personal Info',
                    ),
                    Tab(
                      text: 'Fees',
                    ),
                    // Tab(
                    //   text: 'Exam',
                    // ),
                    Tab(
                      text: 'Result',
                    ),
                    // Tab(
                    //   text: 'Result',
                    // ),
                  ],
                  isScrollable: false,
                  // onTap: handleTabChange,
                ),
              ),

              SizedBox(height: 5.h,),

              /// Personal Information Card
              // PersonalInfoCard(studentDetails),
              Expanded(
                child: TabBarView(
                
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     BoldText(
                          //       text: "Personal Information",
                          //       fontSize: 13.sp,
                          //     ),
                          //     GestureDetector(
                          //       onTap: (){
                          //         Get.snackbar("Edit personaL INFO", "Open dialog");
                          //       },
                          //       child: Container(
                          //         height: 30.h,
                          //         width: 30.w,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: AppColor.card3,
                          //         ),
                          //         child: Icon(
                          //           Icons.edit,
                          //           color: Colors.white,
                          //           size: 18.sp,
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // Divider(
                          //   thickness: 0.5.sp,
                          //   color: Colors.grey.shade300,
                          // ),

                          StudentPersonalInfo(
                            title: "Birth Certificate:",
                            value: studentDetails.birthCertificateNo.toString(),
                          ),

                          StudentPersonalInfo(title: "Father's Name: ", value: studentDetails.fName.toString(),),

                          StudentPersonalInfo(
                            title: "Mother's Name: ",
                            value: studentDetails.mName ?? "",
                          ),

                          StudentPersonalInfo(
                            title: "Father/ Mother Nid: ",
                            value: studentDetails.fNid ?? "",
                          ),

                          StudentPersonalInfo(
                            title: "Contact Number:",
                            value: studentDetails.number.toString(),
                          ),

                          StudentPersonalInfo(
                            title: "Address:",
                            value: studentDetails.address ?? "",
                          ),

                          StudentPersonalInfo(
                            title: "Admission Year:",
                            value: studentDetails.currentEnrollYear ?? "",
                          ),

                          SizedBox(height: 16.h,),

                          CustomButton(
                            onPress: (){},
                            title: "Edit",
                            isLoading: false,
                            width: double.maxFinite,
                            buttonColor: Colors.grey.shade300,
                          ),



                        ],
                      ),
                    ),
                
                    /// Fees Card
                    Card(
                      surfaceTintColor: Colors.white.withOpacity(0.5),
                      shadowColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoldText(
                                  text: "Fees",
                                ),
                
                                GestureDetector(
                                  onTap: (){
                                    Get.snackbar("Add New Fee", "Open dialog");
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
                                ),
                
                              ],
                            ),
                
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade300,
                            ),
                
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoldText(text: "Fees Type",
                                  fontSize: 12.sp,
                                  fontColor: Colors.blue,
                                ),
                                BoldText(
                                  text: "Amount",
                                  fontSize: 12.sp,
                                ),
                                BoldText(
                                  text: "Date",
                                  fontSize: 12.sp,
                                ),
                              ],
                            ),
                
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade300,
                            ),
                
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   primary: false,
                            //   itemCount: 3,
                            //   itemBuilder: (context, index){
                            //     return const Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         SmallText(
                            //           text: "1st Term",
                            //           fontColor: Colors.blue,
                            //         ),
                            //         SmallText(
                            //           text: "2nd Term",
                            //         ),
                            //         // SmallText(text: "Final Term"),
                            //       ],
                            //     );
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                
                    // Text("Exam"),
                    // Text("Exam"),
                
                    /// Result Card
                    Card(
                      surfaceTintColor: Colors.white.withOpacity(0.5),
                      shadowColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            BoldText(
                              text: "Results",
                            ),
                
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade300,
                            ),
                
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoldText(text: "Exam Type",
                                  fontSize: 12.sp,
                                ),
                                BoldText(
                                  text: "Exam Date",
                                  fontSize: 12.sp,
                                ),
                                // BoldText(text: "Final Term"),
                              ],
                            ),
                
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade300,
                            ),
                
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 3,
                              itemBuilder: (context, index){
                                return const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: "1st Term",
                                      fontColor: Colors.blue,
                                    ),
                                    SmallText(
                                      text: "2nd Term",
                                    ),
                                    // SmallText(text: "Final Term"),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                
                
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
