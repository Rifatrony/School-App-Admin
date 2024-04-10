import 'package:get/get.dart';
import 'package:srmm/app/module/splash/controller/splash_controller.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
  }

}