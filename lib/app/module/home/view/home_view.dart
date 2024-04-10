import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/home/view/widget/custom_drawer.dart';
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
        actions: [
          IconButton(
            onPressed: () async {

              // Get.offAllNamed(RouteName.login);
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
                  icon: Icons.school,
                  cardColor: AppColor.card10,
                ),

                SizedBox(width: 10.w,),

                HomeItemCard(
                  onPress: (){
                    Get.toNamed(RouteName.viewTeacher);
                  },
                  title: 'Teachers',
                  total: 16,
                  icon: Icons.person,
                  cardColor: AppColor.card7,
                ),
              ],
            ),

            SizedBox(height: 10.w,),

            Row(
              children: [
                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Fees (Today)',
                  total: 5700,
                  icon: Icons.school,
                  cardColor: AppColor.card8,
                ),

                SizedBox(width: 10.w,),

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'Fees (Monthly)',
                  total: 34650,
                  icon: Icons.school,
                  cardColor: AppColor.card4,
                ),
              ],
            ),

            SizedBox(height: 10.w,),

            Row(
              children: [
                HomeItemCard(
                  onPress: (){

                  },
                  title: 'School',
                  total: 158,
                  icon: Icons.school,
                  cardColor: AppColor.card9,
                ),

                SizedBox(width: 10.w,),

                HomeItemCard(
                  onPress: (){

                  },
                  title: 'School',
                  total: 158,
                  icon: Icons.school,
                  cardColor: AppColor.card5,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}

class HomeItemCard extends StatelessWidget {

  final VoidCallback onPress;
  final String title;
  final int total;
  final IconData icon;
  final Color? cardColor;

  const HomeItemCard({
    super.key, required this.title, required this.total, required this.icon, required this.onPress, this.cardColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: title,
                    fontColor: AppColor.whiteText,
                  ),
                  BoldText(
                    text: total.toString(),
                    fontColor: AppColor.whiteText,
                  ),
                ],
              ),

              Icon(
                  icon,
                  size: 40,
                  color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
