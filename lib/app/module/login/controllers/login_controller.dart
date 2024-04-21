import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srmm/app/data/app_constant.dart';
import 'package:srmm/app/utils/custom_message.dart';

import '../../../api/network_api_services.dart';
import '../../../route/routes.dart';

class LoginController extends GetxController{

  final networkApi = NetworkApiServices();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  final isVisible = false.obs;


  login() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // token = sp.setString(AppConstant.TOKEN, "").toString();

    if(emailController.text.isEmpty && passwordController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Enter Data");
    }
    else {

      isLoading.value = true;

      var data = {
        "email": emailController.text.toString().trim(),
        "password": passwordController.text.toString().trim(),
      };

      try{
        var response = await networkApi.postApi(endpoint: "auth/login", data: data);
        if(response.statusCode == 200){


          if(response.statusCode == 200 && response.data['message'] == 'Admin Login Successful'){
            var token = response.data['access_token'];
            isLoading.value = false;

            sp.setString(AppConstant.TOKEN, token);
            Get.toNamed(RouteName.home);
            CustomMessage.errorMessage("Success", "Login Successful");

          }

          if(response.data['message'] == 'Incorrect password'){
            CustomMessage.errorMessage("Warning", "Incorrect password");
            isLoading.value = false;
          }

          else if(response.data['message'] == 'Email not found'){
            CustomMessage.errorMessage("Warning", "Email not found");
            isLoading.value = false;
          }

          else {
            CustomMessage.errorMessage("Warning", response.data);
            isLoading.value = false;
          }


        }
        else{
          log(response.statusCode.toString());
          CustomMessage.errorMessage("Warning", response.statusCode.toString());
          isLoading.value = false;
        }
      } catch(e){
        log(e.toString());
        isLoading.value = false;
      }
    }


  }
}