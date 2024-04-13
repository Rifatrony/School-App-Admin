import 'package:get/get.dart';
import 'package:srmm/app/module/notice/controller/notice_controller.dart';

class NoticeBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NoticeController>(() => NoticeController());
  }
  
}