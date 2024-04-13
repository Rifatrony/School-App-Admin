import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/module/home/view/widget/custom_drawer.dart';
import 'package:srmm/app/module/home/view/widget/home_card_item.dart';
import 'package:srmm/app/module/home/view/widget/home_card_item2.dart';
import 'package:srmm/app/route/routes.dart';
import 'package:srmm/app/utils/app_color.dart';

import '../../../data/app_constant.dart';
import '../../../widget/text/big_text.dart';
import '../../../widget/text/bold_text.dart';
import '../../../widget/text/small_text.dart';
import '../controller/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //
        //       // Get.offAllNamed(RouteName.login);
        //     },
        //     icon: Icon(Icons.logout),
        //   )
        // ],
        title: const Text("School App (Admin)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [

            Container(
              height: 120.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColor.card4,
              ),
            ),

            SizedBox(height: 10.w,),
            Row(
              children: [
                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.viewStudent);
                  },
                  title: 'Students',
                  total: 158,
                  image: AppImage.studentIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.viewTeacher);
                  },
                  title: 'Teachers',
                  total: 16,
                  image: AppImage.teacherIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Fees',
                  total: 5700,
                  image: AppImage.feesIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Salary',
                  total: 158,
                  image: AppImage.salaryIcon,
                  cardColor: AppColor.card,
                ),
              ],
            ),

            SizedBox(height: 8.w,),

            Row(
              children: [

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.classPage);
                  },
                  title: 'Class',
                  total: 10,
                  image: AppImage.classIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.department);
                  },
                  title: 'Dept.',
                  total: 5,
                  image: AppImage.departmentIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.subject);
                  },
                  title: 'Subject',
                  total: 16,
                  image: AppImage.bodingIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.notice);
                  },
                  title: 'Notice',
                  total: 158,
                  image: AppImage.noticeIcon,
                  cardColor: AppColor.card,
                ),

              ],
            ),

            SizedBox(height: 8.w,),

            Row(
              children: [

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Income',
                  total: 34650,
                  image: AppImage.incomeIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),
                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Cost',
                  total: 158,
                  image: AppImage.costIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Boding',
                  total: 158,
                  image: AppImage.bodingIcon,
                  cardColor: AppColor.card,
                ),



              ],
            ),



            SizedBox(height: 8.w,),

            Row(
              children: [

                HomeItemCard2(
                  onPress: (){

                  },
                  title: 'Routine',
                  image: AppImage.routineIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),

                HomeItemCard2(
                  onPress: (){

                  },
                  title: 'Exam',
                  image: AppImage.examIcon,
                  cardColor: AppColor.whiteText,
                ),
                SizedBox(width: 8.w,),


                HomeItemCard2(
                  onPress: (){

                  },
                  title: 'Result',
                  image: AppImage.resultIcon,
                  cardColor: AppColor.card,
                ),

                SizedBox(width: 8.w,),


                HomeItemCard2(
                  onPress: (){

                  },
                  title: 'About',
                  image: AppImage.aboutIcon,
                  cardColor: AppColor.card,
                ),
              ],
            ),

            Container(
              height: 200,
              color: Colors.red,
              margin: EdgeInsets.only(top: 16.h),
              child: Center(child: Text("Show cost and income in line graph")),
            ),

            Container(
              height: 200,
              color: Colors.red,
              margin: EdgeInsets.only(top: 16.h),
              child: Center(child: Text("Show result in line graph")),
            ),

          ],
        ),
      ),
    );
  }

}


