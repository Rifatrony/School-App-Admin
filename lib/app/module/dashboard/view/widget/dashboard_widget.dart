import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/module/dashboard/view/widget/profile_widget.dart';
import 'package:srmm/app/utils/responsive.dart';

import 'activity_details_card.dart';
import 'bar_graph_card.dart';
import 'header_widget.dart';
import 'line_chart_card.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 18,),

          ActivityDetailsCard(),
          SizedBox(height: 18,),
          const LineChartCard(),
          const SizedBox(height: 18,),
          const BarGraphCard(),
          if(Responsive.isTablet(context))
            ProfileWidget(),
          if(Responsive.isMobile(context))
            ProfileWidget(),
        ],
      ),
    );
  }
}
