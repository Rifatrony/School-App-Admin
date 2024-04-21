import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/about/controller/about_controller.dart';
import 'package:srmm/app/utils/app_color.dart';
import 'package:srmm/app/widget/text/small_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("About School"),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
        SmallText(
          text: controller.aboutText.value,
          fontSize: 14,
        ),
        ),
      ),
    );
  }
}
