import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/utils/responsive.dart';
import 'package:srmm/app/widget/text/bold_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(!Responsive.isDesktop(context))
          IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        Expanded(
          child: Center(
            child: BoldText(
              text: "Mazukahn High School - Admin Panel",
              fontColor: AppColor.whiteText,
              fontSize: Responsive.isMobile(context) ? 14.0 : 24.0,
            ),
          ),
        ),
        SizedBox(width: 40,),

        Container(
          child: Row(
            children: [

              if(Responsive.isDesktop(context))
              CircleAvatar(
                backgroundImage: AssetImage(AppImage.noticeIcon),
              ),
              if(Responsive.isDesktop(context))
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundImage: AssetImage(AppImage.studentIcon),
              ),

              SizedBox(width: 20,),

            ],
          ),
        ),
      ],
    );
  }
}
