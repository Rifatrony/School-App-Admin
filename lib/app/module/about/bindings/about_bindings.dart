import 'package:get/get.dart';
import 'package:srmm/app/module/about/controller/about_controller.dart';

class AboutBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AboutController>(() => AboutController());
  }

}