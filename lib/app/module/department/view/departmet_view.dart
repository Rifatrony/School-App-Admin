import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/widget/text/bold_text.dart';

import '../../../utils/app_color.dart';
import '../../../widget/text/small_text.dart';
import 'package:get/get.dart';
import '../controller/department_controller.dart';

class DepartmentView extends StatelessWidget {
  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepartmentController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Department"),
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
        ListView.builder(
          itemCount: controller.departmentList.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.card4,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SmallText(text: "Department of"),
                        BoldText(text: controller.departmentList[index].name ?? ""),
                        // SmallText(text: controller.departmentList[index]. ?? ""),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    surfaceTintColor: Colors.white,
                    onSelected: (value){
                      if(value == "edit"){
                        /// Do work for a
                        log("Edit Item is : ${index + 1}");
                        // controller.editATeacher(index);
                      }
                      else{
                        /// Do code for B
                      }
                    },
                    itemBuilder: (context){
                      return [
                        PopupMenuItem(
                          value: "edit",
                          child: SmallText(text: "Edit"),
                        ),

                        PopupMenuItem(
                          value: "delete",
                          child: SmallText(text: "Delete"),
                        ),


                      ];
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
