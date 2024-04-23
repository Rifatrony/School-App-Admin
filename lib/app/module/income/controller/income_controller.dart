import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/income/model/income_model.dart';

import '../../../api/network_api_services.dart';
import '../../../utils/custom_message.dart';

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
  final isIncomeAddLoading = false.obs;
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

  addIncome(BuildContext context) async {
    if(incomeTypeController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Write Cost Type");
      return;
    }

    if(incomeAmountController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Cost Amount Required");
      return;
    }

    else {
      try {
        isIncomeAddLoading.value = true;
        var data = {
          'type': incomeTypeController.text.trim(),
          'amount': incomeAmountController.text.trim(),
          'note': noteController.text.trim(),
        };
        var response = await networkServices.postApi(endpoint: 'income/add', data: data);
        if(response.statusCode == 200 || response.statusCode == 201) {
          CustomMessage.successMessage("Success", "New Cost Added");
          isIncomeAddLoading.value = false;
          await fetchIncome();
          Navigator.pop(context);
          incomeTypeController.clear();
          incomeAmountController.clear();
          noteController.clear();
        }

        else {
          isIncomeAddLoading.value = false;
          CustomMessage.successMessage("Error", response.statusCode.toString());
          Navigator.pop(context);
        }
      } catch (e){
        isIncomeAddLoading.value = false;
        Navigator.pop(context);
        log(e.toString());
        CustomMessage.successMessage("Error", e.toString());
      }
    }

  }

}