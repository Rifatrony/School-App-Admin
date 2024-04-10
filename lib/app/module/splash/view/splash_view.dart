import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/splash/controller/splash_controller.dart';
import 'package:srmm/app/utils/app_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Text("Welcome to our App SRMM"),
          Text("Splash Screen"),
        ],
      ),
    );
  }
}
