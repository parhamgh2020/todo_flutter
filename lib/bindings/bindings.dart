import 'package:get/get.dart';
import 'package:project/controllers/task_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskControllers());
  }
}
