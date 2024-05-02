import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/data/side_menu_data.dart';
import 'package:srmm/app/module/dashboard/controller/dashboard_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/utils/responsive.dart';
import 'package:srmm/app/widget/text/bold_text.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class SideMenuWidget extends StatelessWidget {
  final DashboardController controller;
  SideMenuWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final data= SideMenuData();
    return Container(
      color: Responsive.isMobile(context) ? Colors.black : Responsive.isTablet(context) ? Colors.black : Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ListView(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(AppImage.studentIcon),
          ),
          SizedBox(height: 6.h,),
          Center(
            child: BoldText(text: "Admin",
              fontColor: AppColor.whiteText,
            ),
          ),
          SizedBox(height: 6.h,),
          Center(
            child: SmallText(
              text: "admin@gmail.com",
              fontColor: AppColor.whiteText,
            ),
          ),
          SizedBox(height: 16.h,),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: data.menu.length,
            itemBuilder: (context, index)=> Obx(()=> buildMenuEntry(data, index, context)),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index, BuildContext context){
    final isSelected = controller.selectedIndex.value == index;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.selectionColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: InkWell(
        onTap: (){
          controller.selectedIndex.value = index;
          if(Responsive.isMobile(context))
            Navigator.pop(context);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(data.menu[index].icon,
                color: isSelected? Colors.black : Colors.grey,
              ),
            ),

            Text(
              data.menu[index].title,
              style: TextStyle(
                color: isSelected? Colors.black : Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
