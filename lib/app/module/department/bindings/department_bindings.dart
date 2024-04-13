import 'package:get/get.dart';
import 'package:srmm/app/module/department/controller/department_controller.dart';

class DepartmentBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DepartmentController>(() => DepartmentController());
  }

}