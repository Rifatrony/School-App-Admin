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

    onRefresh() async {
      await Future.delayed(Duration(milliseconds: 1000), (){
        controller.fetchIncome();
      },);
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Income"),
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
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
                    RefreshIndicator(
                      onRefresh: onRefresh,
                      child: ListView.builder(
                        itemCount: controller.incomeList.length,
                        itemBuilder: (context, index){
                          final income = controller.incomeList[index];
                          return Container(
                            padding: EdgeInsets.all(10.sp),
                            margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.grey.shade200,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BoldText(text: "Income type: ${income.type ?? ""}"),
                                      SizedBox(height: 4.h,),
                                      Text("${income.amount.toString() ?? ""} Tk."),
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
                  ),

                  Center(child: Text("Monthly Income")),
                  Center(child: Text("Total Income")),
                ],
              ),
            ),
          ],
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
                    controller.addIncome(context);
                  },
                  child: Container(
                    // height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColor.card3,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Obx(()=>
                      Center(
                        child: controller.isIncomeAddLoading.value ? Center(child: CircularProgressIndicator()) : BoldText(
                          text: "SAVE",
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
        backgroundColor: AppColor.card8,
        shape: CircleBorder(),
      ),
    );
  }
}
