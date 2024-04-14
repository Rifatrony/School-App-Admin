import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:srmm/app/api/network_api_servies.dart';

import '../model/class_model.dart';

class ClassController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    fetchClass();
  }

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;
  final classList = List<Data>.empty().obs;
  final sectionList = List<Data>.empty().obs;

  RxInt selectedClassId = (-1).obs;
  var selectedClass = RxString('');

  // Function to update the selected class ID
  // void updateSelectedClassId(String id) {
  //   selectedClassId.value = id;
  // }

  fetchClass() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'class/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final allClassModel = allClassModelFromJson(jsonEncode(responseData));

        classList.value = allClassModel.data ?? [];
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


  fetchSection() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'section/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final allClassModel = allClassModelFromJson(jsonEncode(responseData));

        classList.value = allClassModel.data ?? [];
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

  onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000),(){
      fetchClass();
    });
  }
}
