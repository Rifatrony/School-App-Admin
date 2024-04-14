import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/student/model/student_model.dart';

import '../../../api/network_api_servies.dart';

class StudentController extends GetxController{

  final nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchStudent();
  }

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;
  final studentList = List<Student>.empty().obs; // Adjusted to use Data type directly

  List<int> years = List.generate(6, (index) => DateTime.now().year - 5 + index);

  // Define an RxInt to hold the selected year
  RxInt selectedYear = DateTime.now().year.obs; // RxInt for reactive updates

  // Function to update the selected year
  void updateSelectedYear(int year) {
    selectedYear.value = year;
  }

  fetchStudent() async {
    isLoading.value = true;

    try{
      var year = selectedYear.value; // Get the selected year from the dropdown
      if (year == null) {
        year = DateTime.now().year; // If no year is selected, use the current year
      }

      var response = await networkServices.getApi(endpoint: 'student/view/$year');
      if(response.statusCode == 200){
        final responseData = response.data;

        final studentModel = studentModelFromJson(jsonEncode(responseData));

        studentList.value = studentModel.students ?? [];
        isLoading.value = false;
      }
      else{
        print(response.statusCode.toString());
        isLoading.value = false;
      }
    } catch(e, stackTrace){
      log(e.toString());
      isLoading.value = false;
      print(stackTrace);
    }
  }

}