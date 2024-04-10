import 'package:get/get.dart';
import 'package:srmm/app/module/student/controller/student_controller.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StudentController>(() => StudentController());
  }

}