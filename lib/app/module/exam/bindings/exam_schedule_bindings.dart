import 'package:get/get.dart';
import 'package:srmm/app/module/exam/controller/exam_schedula_controller.dart';

class ExamScheduleBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExamScheduleController>(() => ExamScheduleController());
  }

}