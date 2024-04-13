import 'package:get/get.dart';
import 'package:srmm/app/module/classes/controller/class_controller.dart';

class ClassBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ClassController>(() => ClassController());
  }

}