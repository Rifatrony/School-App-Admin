import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:srmm/app/module/notice/model/notice_model.dart';

import '../../../api/network_api_services.dart';

class NoticeController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    fetchNotice();
    fetchLatestNotice();
  }

  final networkServices = NetworkApiServices();

  final isLoading = false.obs;
  final isLatestLoading = false.obs;
  final noticeList = List<Notice>.empty().obs;
  final latestNoticeList = List<Notice>.empty().obs;

  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  fetchNotice() async {
    isLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'notice/view-all');
      if(response.statusCode == 200){
        final responseData = response.data;

        final noticeModel = noticeModelFromJson(jsonEncode(responseData));

        noticeList.value = noticeModel.notices ?? [];
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

  fetchLatestNotice() async {
    isLatestLoading.value = true;

    try{
      var response = await networkServices.getApi(endpoint: 'notice/view/latest');
      if(response.statusCode == 200){
        final responseData = response.data;

        final noticeModel = noticeModelFromJson(jsonEncode(responseData));

        latestNoticeList.value = noticeModel.notices ?? [];
        isLatestLoading.value = false;
      }
      else{
        print(response.statusCode.toString());
        isLatestLoading.value = false;
      }
    } catch(e, stackTrace){
      log(e.toString());
      isLatestLoading.value = false;
      print(stackTrace);
    }
  }
}