import 'package:get/get.dart';

import '../../../api/network_api_servies.dart';

class AboutController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAbout();
  }

  final networkApiServices = NetworkApiServices();

  final isLoading = false.obs;

  fetchAbout() async {

  }


}