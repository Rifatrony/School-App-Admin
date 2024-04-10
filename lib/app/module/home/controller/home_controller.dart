import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  }
}