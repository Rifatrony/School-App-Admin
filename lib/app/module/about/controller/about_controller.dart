import 'package:get/get.dart';

import '../../../api/network_api_services.dart';

class AboutController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAbout();
  }

  final networkApiServices = NetworkApiServices();

  final isLoading = false.obs;

  final aboutText = "".obs;

  fetchAbout() async {
    try {
      isLoading.value = true;
      var response = await networkApiServices.getApi(endpoint: 'about/view');
      if(response.statusCode == 200) {
        print("Success");
        // print(response.data);
        aboutText.value = response.data['about']['text'];

        isLoading.value = false;
      }
      else {
        print(response.statusCode.toString());
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
    }
  }


}