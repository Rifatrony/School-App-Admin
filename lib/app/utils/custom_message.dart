import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomMessage {
  static void errorMessage(String title, String message){
    Get.snackbar(
      title,
      message,
      duration: Duration(
        milliseconds: 1000,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp,),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
    );
  }

  static void successMessage(String title, String message){
    Get.snackbar(
      title,
      message,
      duration: Duration(
        milliseconds: 1000,
      ),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp,),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      // mainButton: TextButton(
      //   onPressed: () {
      //     // Perform some action when the user presses the action button
      //     Get.back();
      //   },
      //   child: Text(
      //     'OK',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
    );
  }

  static void successToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }
}