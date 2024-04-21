import 'package:get/get.dart';
import 'package:srmm/app/module/routine/controller/routine_controller.dart';

class RoutineBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RoutineController>(() => RoutineController());
  }

}