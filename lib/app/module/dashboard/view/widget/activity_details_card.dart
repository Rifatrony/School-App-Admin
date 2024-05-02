import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/utils/responsive.dart';

import '../../../../data/dashboard_data.dart';
import 'custom_card.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {

    final dashboardDetails = DashboardData();

    return GridView.builder(
      itemCount: dashboardDetails.dashboardList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : Responsive.isTablet(context) ? 4 : 5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
        childAspectRatio: 11.h/6.0,
      ),
      itemBuilder: (context, index) => CustomCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dashboardDetails.dashboardList[index].title),
                  SizedBox(height: 5.h,),
                  Text(dashboardDetails.dashboardList[index].value),
                ],
              ),

              SizedBox(width: 5.w,),

              Image.asset(
                dashboardDetails.dashboardList[index].icon,
                height: MediaQuery.of(context).size.height * 0.06,
                opacity: AlwaysStoppedAnimation(0.3),
              ),

            ],
          )
      )


    );
  }
}
