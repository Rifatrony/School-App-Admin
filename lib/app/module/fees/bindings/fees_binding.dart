import 'package:get/get.dart';
import 'package:srmm/app/module/fees/controller/fees_controller.dart';

class FeesBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FeesController>(() => FeesController());
  }

}