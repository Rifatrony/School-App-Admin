import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srmm/app/route/routes.dart';

import '../../../data/app_constant.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLogin();
  }

  checkLogin() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(AppConstant.TOKEN);
    if(token != null && token != ""){
      Future.delayed(Duration(milliseconds: 2000),(){
        Get.offAllNamed(RouteName.dashboard);
      });
    }
    else {
      Future.delayed(Duration(milliseconds: 2000),(){
        Get.offAllNamed(RouteName.login);
      });
    }
  }
}