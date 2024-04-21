import 'package:get/get.dart';

import '../controller/income_controller.dart';

class IncomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<IncomeController>(() => IncomeController());
  }

}