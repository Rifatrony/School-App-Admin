import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/cost/controller/cost_controller.dart';
import 'package:srmm/app/widget/text_form/custom_text_form.dart';

import '../../../utils/app_color.dart';
import '../../../widget/text/bold_text.dart';
import '../../../widget/text/small_text.dart';

class CostView extends StatelessWidget {
  const CostView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CostController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("Cost"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: 40.h,
              padding: const EdgeInsets.all(6),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
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
                    text: 'Today',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                  Tab(
                    text: 'Total',
                  ),
                ],
                isScrollable: false,
                // onTap: handleTabChange,
              ),
            ),

            SizedBox(height: 16.h,),

            Expanded(
              child: TabBarView(
                children: [
                  Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
                    ListView.builder(
                      itemCount: controller.costList.length,
                      itemBuilder: (context, index){
                        final income = controller.costList[index];
                        return Container(
                          padding: EdgeInsets.all(10.sp),
                          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.redAccent,
                          ),
                          child: Row(
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
                                iconColor: Colors.white,
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
              
                  Center(child: Text("Monthly Cost")),
                  Center(child: Text("Total Cost")),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(

            title: "Add Cost",
            // middleText: "Are you sure you want to logout?",
            backgroundColor: Colors.white,
            barrierDismissible: false,
            titlePadding: EdgeInsets.only(top: 15.h),
            content: Column(
              children: [

                // SmallText(text: 'Are you sure you want to logout?'),
                SizedBox(height: 5.h,),

                CustomTextForm(controller: controller.costTypeController, hintText: "Cost Type"),

                SizedBox(height: 10.h,),

                CustomTextForm(
                  controller: controller.costAmountController, hintText: "Amount",
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: 10.h,),

                CustomTextForm(
                  controller: controller.noteController,
                  hintText: "Note",
                  keyBoardType: TextInputType.name,
                  maxLine: 3,
                ),

                SizedBox(height: 18.h,),

                GestureDetector(
                  onTap: () async {
                    // Get.back();
                    controller.addCost(context);
                    // SharedPreferences sp = await SharedPreferences.getInstance();
                    // sp.remove(AppConstant.TOKEN);
                    // Get.offAllNamed(RouteName.login);
                  },
                  child: Container(
                    // height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Obx(()=>
                      Center(
                        child: controller.isCostAddLoading.value ? Center(child: CircularProgressIndicator()) : BoldText(
                          text: "SAVE",
                          fontSize: 12.sp,
                          fontColor: AppColor.whiteText,
                        ),
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
        backgroundColor: Colors.redAccent,
        shape: CircleBorder(),
      ),
    );
  }
}
