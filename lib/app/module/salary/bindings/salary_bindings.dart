import 'package:get/get.dart';
import 'package:srmm/app/module/salary/controller/salary_controller.dart';

class SalaryBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SalaryController>(() => SalaryController());
  }

}