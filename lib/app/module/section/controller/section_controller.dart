import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:srmm/app/module/section/model/section_model.dart';

import '../../../api/network_api_services.dart';

class SectionController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchSection();
  }

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;

  final sectionList = List<Section>.empty().obs;
  var selectedSection = RxString('');

  fetchSection(String classId) async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'section/view-all/$classId');
      if(response.statusCode == 200){
        final responseData = response.data;

        final allSectionModel = sectionModelFromJson(jsonEncode(responseData));

        sectionList.value = allSectionModel.sections ?? [];
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