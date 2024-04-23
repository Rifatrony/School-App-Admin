import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srmm/app/utils/custom_message.dart';

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
  final isCostAddLoading = false.obs;
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

  addCost(BuildContext context) async {
    if(costTypeController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Write Cost Type");
      return;
    }

    if(costAmountController.text.isEmpty){
      CustomMessage.errorMessage("Warning", "Cost Amount Required");
      return;
    }
    
    else {
        try {
          isCostAddLoading.value = true;
          var data = {
            'type': costTypeController.text.trim(),
            'amount': costAmountController.text.trim(),
            'note': noteController.text.trim(),
          };
          var response = await networkServices.postApi(endpoint: 'cost/add', data: data);
          if(response.statusCode == 200 || response.statusCode == 201) {
            CustomMessage.successMessage("Success", "New Cost Added");
            isCostAddLoading.value = false;
            await fetchCost();
            Navigator.pop(context);
            costTypeController.clear();
            costAmountController.clear();
            noteController.clear();
          }

          else {
            isCostAddLoading.value = false;
            CustomMessage.successMessage("Error", response.statusCode.toString());
            Navigator.pop(context);
          }
        } catch (e){
          isCostAddLoading.value = false;
          Navigator.pop(context);
          log(e.toString());
          CustomMessage.successMessage("Error", e.toString());
        }
    }
    
  }

}