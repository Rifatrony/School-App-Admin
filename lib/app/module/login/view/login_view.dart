import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/login/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    var controller = Get.put(LoginController());

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, // Make status bar transparent
    // ));

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent keyboard from resizing the screen
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFF826F),
              Color(0xffFF7B6F),
              Color(0xffFF6D6F),
              Color(0xffFF5D6F),
              Color(0xffFF526F),
              Color(0xffFF3E6F),
            ], // Set your gradient colors here
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.h,),
            Container(
              height: 90.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),

            SizedBox(height: 30.h,),

            /// Email Text From Field

            Container(
              // width: size.width * 0.70,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  suffixIcon: Icon(Icons.email,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h,),

            /// Password Text From Field

            Obx(()=>
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.passwordController,
                obscureText: controller.isVisible.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: InkWell(
                    onTap: (){
                      controller.isVisible.value =! controller.isVisible.value;
                    },
                    child: Icon(
                      controller.isVisible.value ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),
                ),
              ),
            ),

            // Container(
            //   height: 45.h,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30.r),
            //       border: Border.all(
            //           width: 0.3,
            //           color: Colors.white
            //       )
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Container(
            //         height: 45.sp,
            //         width: 45.sp,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           shape: BoxShape.circle,
            //         ),
            //         child: Icon(
            //           Icons.lock_outline,
            //           size: 16,
            //         ),
            //       ),
            //       Expanded(
            //         child: SizedBox(
            //           height: 30.sp,
            //           child: Obx(()=>
            //             TextFormField(
            //               controller: controller.passwordController,
            //               obscureText: !controller.isVisible.value,
            //               style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: Colors.white,
            //                 letterSpacing: 3,
            //               ),
            //               decoration: InputDecoration(
            //
            //                 border: InputBorder.none,
            //                 hintText: "Password",
            //                 hintStyle: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w300,
            //                 ),
            //                 contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //
            //       GestureDetector(
            //         onTap: (){
            //           controller.isVisible.value =! controller.isVisible.value;
            //         },
            //         child: Obx(()=>
            //           Padding(
            //             padding: EdgeInsets.only(right: 15.w),
            //             child: Icon(
            //               controller.isVisible.value ? Icons.visibility : Icons.visibility_off,
            //               size: 18,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: 40.h,),


            /// Password Button

            Obx(()=>
              GestureDetector(
                onTap: (){
                  controller.login();
                },
                child: Container(
                  height: 42.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: controller.isLoading.value ? CircularProgressIndicator() : Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),

            Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 60.h,),

          ],
        ),
      ),
    );
  }
}
