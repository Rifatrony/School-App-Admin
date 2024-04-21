import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/income/controller/income_controller.dart';

import '../../../utils/app_color.dart';
import '../../../widget/text/bold_text.dart';
import '../../../widget/text/small_text.dart';
import '../../../widget/text_form/custom_text_form.dart';

class IncomeView extends StatelessWidget {
  const IncomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(IncomeController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Income"),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
        ListView.builder(
          itemCount: controller.incomeList.length,
          itemBuilder: (context, index){
            final income = controller.incomeList[index];
            return Container(
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.card8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(income.type ?? ""),
                        Text(income.amount.toString() ?? ""),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    surfaceTintColor: AppColor.card,
                    onSelected: (value) {
                      if (value == "edit") {
                        log("Edit Item is : ${index + 1}");
                      } else {
                        // Do code for B
                      }
                    },
                    itemBuilder: (context) {
                      return const [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(RouteName.addNotice);
          Get.defaultDialog(

            title: "Add Income",
            // middleText: "Are you sure you want to logout?",
            backgroundColor: Colors.white,
            barrierDismissible: false,
            titlePadding: EdgeInsets.only(top: 15.h),
            content: Column(
              children: [

                // SmallText(text: 'Are you sure you want to logout?'),
                SizedBox(height: 5.h,),

                CustomTextForm(controller: controller.incomeTypeController, hintText: "Income Type"),

                SizedBox(height: 10.h,),

                CustomTextForm(
                  controller: controller.incomeAmountController, hintText: "Amount",
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: 10.h,),

                CustomTextForm(
                  controller: controller.noteController,
                  hintText: "Note",
                  keyBoardType: TextInputType.text,
                  maxLine: 3,
                ),

                SizedBox(height: 18.h,),

                GestureDetector(
                  onTap: () async {
                    Get.back();
                    // SharedPreferences sp = await SharedPreferences.getInstance();
                    // sp.remove(AppConstant.TOKEN);
                    // Get.offAllNamed(RouteName.login);
                  },
                  child: Container(
                    // height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColor.card3,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: BoldText(
                        text: "SAVE",
                        fontColor: AppColor.whiteText,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h,),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColor.card8,
        shape: CircleBorder(),
      ),
    );
  }
}
