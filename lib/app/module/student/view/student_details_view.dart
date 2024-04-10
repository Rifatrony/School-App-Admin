import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/module/student/view/widget/personal_info_card.dart';
import 'package:srmm/app/module/student/view/widget/student_personal_into_widget.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
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
                        SmallText(text: "ID: 2400001"),
                        SizedBox(height: 4.h,),
                        SmallText(text: "Roll No: 01"),
                        SizedBox(height: 4.h,),
                        SmallText(text: "Class: One"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 5.h,),

            /// Personal Information Card
            const PersonalInfoCard(),

            SizedBox(height: 5.h,),

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

            SizedBox(height: 5.h,),

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
    );
  }
}
