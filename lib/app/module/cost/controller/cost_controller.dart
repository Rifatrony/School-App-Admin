import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/network_api_services.dart';
import '../model/cost_model.dart';

class CostController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    fetchCost();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

  final costTypeController = TextEditingController();
  final costAmountController = TextEditingController();
  final noteController = TextEditingController();

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;
  final costList = List<Cost>.empty().obs;

  fetchCost() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'cost/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final costModel = costModelFromJson(jsonEncode(responseData));

        costList.value = costModel.cost ?? [];
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

  addCost() async {

  }

}