import 'package:get/get.dart';
import 'package:srmm/app/module/home/controller/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }

}