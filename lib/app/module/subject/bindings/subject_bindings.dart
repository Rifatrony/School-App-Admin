import 'package:get/get.dart';

class SubjectBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SubjectBindings>(() => SubjectBindings());
  }

}