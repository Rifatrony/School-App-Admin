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

    onRefresh() async {
      await Future.delayed(
        Duration(milliseconds: 1000), (){
          controller.fetchDepartment();
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Department"),
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
        RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            itemCount: controller.departmentList.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColor.card,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SmallText(text: "Department of"),
                              SizedBox(width: 10.w,),
                              BoldText(text: controller.departmentList[index].name ?? "",),
                            ],
                          ),

                          SizedBox(height: 5.w,),

                          SmallText(text: "Total Student: 1512"),
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
      ),
    );
  }
}
