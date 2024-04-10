import 'package:get/get.dart';

import '../controller/teacher_controller.dart';

class TeacherBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TeacherController>(() => TeacherController());
  }

}