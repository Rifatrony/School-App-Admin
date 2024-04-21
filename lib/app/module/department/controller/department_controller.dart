import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../api/network_api_services.dart';
import '../model/department_model.dart';

class DepartmentController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDepartment();
  }


  final networkServices = NetworkApiServices();
  final isLoading = false.obs;
  final departmentList = List<Department>.empty().obs;

  var selectedDepartment = RxString('');

  fetchDepartment() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'department/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final allClassModel = departmentModelFromJson(jsonEncode(responseData));

        departmentList.value = allClassModel.departments ?? [];
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