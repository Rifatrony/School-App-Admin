import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/income/model/income_model.dart';

import '../../../api/network_api_services.dart';

class IncomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    fetchIncome();
  }

  final incomeTypeController = TextEditingController();
  final incomeAmountController = TextEditingController();
  final noteController = TextEditingController();

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;
  final incomeList = List<Income>.empty().obs;

  fetchIncome() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'income/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final noticeModel = incomeModelFromJson(jsonEncode(responseData));

        incomeList.value = noticeModel.income ?? [];
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