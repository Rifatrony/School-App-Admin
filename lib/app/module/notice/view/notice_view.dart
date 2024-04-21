import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/notice/controller/notice_controller.dart';
import 'package:srmm/app/route/routes.dart';
import 'package:srmm/app/widget/text/bold_text.dart';

import '../../../utils/app_color.dart';
import '../../../widget/text/small_text.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoticeController());

    void handleTabChange(int tabIndex) {
      if (tabIndex == 0) {
        controller.fetchLatestNotice();
      } else {
        controller.fetchNotice();
      }
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("Notice"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(
                  text: 'New Notice',
                ),
                Tab(
                  text: 'All Notice',
                ),
              ],
              isScrollable: false,
              onTap: handleTabChange,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Obx(() => controller.isLatestLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 2000));
                      controller.fetchLatestNotice();
                    },
                    child: ListView.builder(
                      itemCount: controller.latestNoticeList.length,
                      itemBuilder: (context, index) {
                        final notice = controller.latestNoticeList[index];
                        return Container(
                          margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColor.card,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(
                                      text: notice.title ?? "",
                                      fontColor: Colors.green,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notice.subtitle ?? "",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: AppColor.buttonColor1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notice.message ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey.shade600),
                                    ),
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
                  )),
                  Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 2000));
                      controller.fetchNotice();
                    },
                    child: ListView.builder(
                      itemCount: controller.noticeList.length,
                      itemBuilder: (context, index) {
                        final notice = controller.noticeList[index];
                        return Container(
                          margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColor.card,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(
                                      text: notice.title ?? "",
                                      fontColor: Colors.green,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notice.subtitle ?? "",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: AppColor.buttonColor1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notice.message ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey.shade600),
                                    ),
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
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.addNotice);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColor.card6,
        shape: CircleBorder(),
      ),
    );
  }
}
