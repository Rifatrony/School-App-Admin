import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/department/controller/department_controller.dart';
import 'package:srmm/app/module/section/controller/section_controller.dart';
import 'package:srmm/app/module/student/model/student_model.dart';
import 'package:srmm/app/utils/custom_message.dart';

import '../../../api/network_api_services.dart';
import 'package:intl/intl.dart';

import '../../classes/controller/class_controller.dart';

class StudentController extends GetxController{

  final classController = Get.put(ClassController());
  final sectionController = Get.put(SectionController());
  final departmentController = Get.put(DepartmentController());

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final birthController = TextEditingController();
  final ageController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final numberController = TextEditingController();
  final nidController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchStudent();
    ever(selectedDate, (_) {
      // Format the selected date
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value);
      dateController.text = formattedDate;
    });
  }

  final networkServices = NetworkApiServices();

  var selectedValue = RxInt(0); // Observable to track the selected value

  void updateSelectedValue(int value) {
    selectedValue.value = value; // Update the selected value
  }

  final isLoading = false.obs;
  final isAddStudentLoading = false.obs;


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

  List<Student> filteredStudentList = [];

  filterStudents(String query) {
    // Clear previous filtered list
    filteredStudentList.clear();

    // If the query is empty, display all students
    if (query.isEmpty) {
      filteredStudentList.addAll(studentList);
    } else {
      // Filter students whose names contain the query string
      filteredStudentList.addAll(studentList.where((student) =>
          student.name.toString().toLowerCase().contains(query.toLowerCase())));
    }
  }

  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      print(selectedDate.value);
    }
  }

  addStudent() async {

    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value);

    if(classController.selectedClassId.value.isEmpty){
      CustomMessage.errorMessage("Warning", "Select a Class");
      return;
    }

    else if(departmentController.selectedDepartment.value.isEmpty){
      CustomMessage.errorMessage("Warning", "Select a Department");
      return;
    }

    else if(sectionController.selectedSection.value.isEmpty){
      CustomMessage.errorMessage("Warning", "Select a Section");
      return;
    }

    else if(nameController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Name Required");
      return;
    }

    else if(birthController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Birth Certificate Required");
      return;
    }

    else if(selectedValue.value == 0){
      CustomMessage.errorMessage("Warning", "Select Gender");
      return;
    }

    else if(ageController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Student Age Required");
      return;
    }

    else if(fatherNameController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Father's Name Required");
      return;
    }

    else if(motherNameController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Mother's Name Required");
      return;
    }

    else if(numberController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Father's/ Mother's Number Required");
      return;
    }

    else if(nidController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Father's/ Mother's NID Required");
      return;
    }

    else if(dateController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Admission Date Required");
      return;
    }

    else if(addressController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Address Required");
      return;
    }

    else {
      isAddStudentLoading.value = true;
      var data = {
        'class_id': classController.selectedClassId.value,
        'section_id': sectionController.selectedSection.value,
        'department_id': departmentController.selectedDepartment.value,
        'name': nameController.text,
        'birth_certificate_no': birthController.text,
        'age': ageController.text,
        'gender': selectedValue.value == 1 ? "Male" : "Female",
        'f_name': fatherNameController.text,
        'f_nid': nidController.text,
        'number': numberController.text,
        'm_name': motherNameController.text,
        'address': addressController.text,
        'password': "12345678",
        'current_enroll_year': selectedYear.value,
        'enroll_date': formattedDate,
      };

      try{
        var response = await networkServices.postApi(endpoint: "student/add/${classController.selectedClassId.value}", data: data);
        if(response.statusCode == 201){
          print("Success");
          CustomMessage.successMessage("Success", "New Student Added");
          isAddStudentLoading.value = false;
          await fetchStudent();
        }
        else {
          print(response.statusCode.toString());
          isAddStudentLoading.value = false;
        }
      } catch(e){
        isAddStudentLoading.value = false;
        print(e.toString());
      }
    }




  }

}