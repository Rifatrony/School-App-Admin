import 'package:get/get.dart';
import 'package:srmm/app/module/cost/controller/cost_controller.dart';

class CostBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CostController>(() => CostController());
  }

}