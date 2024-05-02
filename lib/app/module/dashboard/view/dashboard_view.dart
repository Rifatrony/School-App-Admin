import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:srmm/app/module/dashboard/controller/dashboard_controller.dart';
import 'package:srmm/app/module/dashboard/view/widget/dashboard_widget.dart';
import 'package:srmm/app/module/dashboard/view/widget/header_widget.dart';
import 'package:srmm/app/module/dashboard/view/widget/side_menu_widget.dart';
import 'package:srmm/app/module/student/view/student_view.dart';
import 'package:srmm/app/utils/responsive.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer: !isDesktop ? SizedBox(
        width: 250,
        child: SideMenuWidget(controller: controller,),
      ) : null,
      body: SafeArea(
        child: Row(
          children: [
            if(isDesktop)
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(controller: controller),
                ),
              ),

            Expanded(
              flex: 10,
              child: Column(
                children: [
                  SizedBox(height: 18.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: const HeaderWidget(),
                  ),
                  Expanded(
                    child: Obx(() {
                      switch (Get.find<DashboardController>().selectedIndex.value) {
                        case 0:
                          return SingleChildScrollView(
                            child: DashboardWidget(),
                          );
                        case 1:
                          return SingleChildScrollView(
                            child: StudentView(),
                          );

                        case 2:
                          return SingleChildScrollView(
                            child: Text("hdsbchkdsb"),
                          );
                      // Add cases for other indices if needed
                        default:
                          return Container(); // or any default widget
                      }
                    }),
                  ),
                ],
              ),
            ),


            // if(isDesktop)
            //   Expanded(
            //     flex: 3,
            //     child: SingleChildScrollView(
            //       child: ProfileWidget()
            //     ),
            //   ),
          ]
        ),
      ),
    );
  }
}
