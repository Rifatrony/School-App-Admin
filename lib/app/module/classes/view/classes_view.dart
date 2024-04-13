import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/utils/app_color.dart';

import '../controller/class_controller.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ClassController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: const Text("Class"),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55, top: 10),
        child: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            gridDelegate: (
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                )),
            itemCount: controller.classList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  print("Id is =====> ${controller.classList[index].classId.toString()}");
                },
                child: Container(
                  // margin: EdgeInsets.only(bottom: 60.h),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: AppColor.card,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      controller.classList[index].name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
