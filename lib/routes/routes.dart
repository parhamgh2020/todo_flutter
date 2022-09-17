import 'package:get/get.dart';
import 'package:project/pages/home_screen.dart';
import 'package:project/pages/add_tasks_screen.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: '/home_screen', page: () => const HomeScreen()),
        GetPage(name: '/add_screen', page: () => const MyAddTasks()),
      ];
}
