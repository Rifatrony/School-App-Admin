import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srmm/app/module/home/view/widget/drawer_item.dart';
import 'package:srmm/app/route/routes.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

import '../../../../data/app_constant.dart';
import '../../../../widget/button/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,

      ),
      child: SafeArea(
        child: ListView(
          children: [

            /// Header Section
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(height: 4.h,),
                  BoldText(text: "Admin"),
                  SmallText(text: "admin@gmail.com"),

                  SizedBox(height: 8.h,),

                  Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
              },
              title: "Home",
              icon: Icons.home_rounded,
            ),

            Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.back();
                Get.toNamed(RouteName.viewStudent);
              },
              title: "View Students",
              icon: Icons.home_rounded,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.back();
                Get.toNamed(RouteName.addStudent);
              },
              title: "Add Students",
              icon: Icons.home_rounded,
            ),


            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.toNamed(RouteName.viewStudent);
              },
              title: "Student Fees",
              icon: Icons.home_rounded,
            ),

            Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.viewTeacher);
              },
              title: "View Teacher",
              icon: Icons.home_rounded,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.addTeacher);
              },
              title: "Add Teacher",
              icon: Icons.home_rounded,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.toNamed(RouteName.viewStudent);
              },
              title: "Salary",
              icon: Icons.home_rounded,
            ),

            Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.toNamed(RouteName.viewStudent);
              },
              title: "View Cost",
              icon: Icons.home_rounded,
            ),


            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                // Get.toNamed(RouteName.viewStudent);
              },
              title: "Add Cost",
              icon: Icons.home_rounded,
            ),

            Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),

            DrawerItem(
              onPress: (){
                Navigator.pop(context);
                Get.defaultDialog(
                  title: "Logout!!!",
                  middleText: "Are you sure you want to logout?",
                  backgroundColor: Colors.white,
                  barrierDismissible: false,
                  content: Column(
                    children: [

                      SmallText(text: 'Are you sure you want to logout?'),

                      SizedBox(height: 10.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Get.back();
                              SharedPreferences sp = await SharedPreferences.getInstance();
                              sp.remove(AppConstant.TOKEN);
                              Get.offAllNamed(RouteName.login);
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
                                  text: "YES",
                                  fontColor: AppColor.whiteText,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: AppColor.card4,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: BoldText(
                                  text: "NO",
                                  fontColor: AppColor.whiteText,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h,),
                );
                // Get.toNamed(RouteName.viewStudent);
              },
              title: "Logout",
              icon: Icons.home_rounded,
            ),

            
            Divider(
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),

            
          ],
        ),
      ),
    );
  }
}
