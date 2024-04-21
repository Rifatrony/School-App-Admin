import 'package:get/get.dart';
import 'package:srmm/app/module/result/controller/result_controller.dart';

class ResultBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ResultController>(() => ResultController());
  }

}