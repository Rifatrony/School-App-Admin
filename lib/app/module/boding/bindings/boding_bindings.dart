import 'package:get/get.dart';
import 'package:srmm/app/module/boding/controller/boding_controller.dart';

class BodingBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BodingController>(() => BodingController());
  }

}