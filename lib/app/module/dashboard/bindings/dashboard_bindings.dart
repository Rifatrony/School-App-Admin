import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';
class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
  }

}