import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/teacher/controller/teacher_controller.dart';
import 'package:srmm/app/route/routes.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/big_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: Text("View All Teacher"),
        centerTitle: true,
        actions: [

          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.search),
          ),

          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.filter_alt_outlined,),
          ),

        ],
      ),
      body: Column(
        children: [
          // Text("sdbvhbdsjv "),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 10,
              padding: EdgeInsets.only(bottom: 60.h),
              itemBuilder: (context, index){
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h, ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Teacher ${index + 1}"),
                            SmallText(text: "01628979644"),
                          ],
                        ),
                      ),

                      PopupMenuButton(
                        color: Colors.white,
                        onSelected: (value){
                          if(value == "edit"){
                            /// Do work for a
                            log("Edit Item is : ${index + 1}");
                            controller.editATeacher(index);
                          }
                          else if(value == 'delete'){
                            /// Do code for b
                            controller.deleteATeacher(index);
                          }

                          else{
                            /// Do code for C
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

                            PopupMenuItem(
                              value: "salary",
                              child: SmallText(text: "Salary"),
                            ),

                          ];
                        },
                      ),

                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(RouteName.addTeacher);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
