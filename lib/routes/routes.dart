import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/pages/add_task_screen.dart';
import 'package:project/pages/home_screen.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(
          name: '/homescreen',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/addscreen',
          page: () => const AddTaskScreen(),
        )
      ];
}
