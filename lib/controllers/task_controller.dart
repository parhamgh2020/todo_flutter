import 'package:get/get.dart';
import 'package:project/models/task_model.dart';

class TaskControllers extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
}
