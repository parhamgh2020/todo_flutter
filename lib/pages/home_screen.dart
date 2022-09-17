import 'package:flutter/material.dart';
import 'package:project/constant.dart';
import 'package:get/get.dart';
import 'package:project/controllers/task_controller.dart';
import 'package:project/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(kLightBlueColor, Brightness.light);
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: const [
            UpperContainer(),
            DownerContainer(),
          ],
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'hero',
      onPressed: () {
        Get.toNamed("/add_screen")!.then((value) {
          MyApp.changeColor(kLightBlueColor, Brightness.light);
        });
      },
      elevation: 0,
      backgroundColor: kLightBlueColor,
      child: const Icon(Icons.add),
    );
  }
}

class DownerContainer extends StatelessWidget {
  const DownerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: myTasks(),
    );
  }

  Container myTasks() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text(Get.find<TaskControllers>().tasks[index].taskTitle ?? ''),
            subtitle:
                Text(Get.find<TaskControllers>().tasks[index].taskSubtitle!),
            onTap: () {},
            trailing: Checkbox(
              activeColor: kLightBlueColor,
              onChanged: (value) {},
              value: Get.find<TaskControllers>().tasks[index].status,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2.5),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
            height: 2,
          );
        },
        itemCount: Get.find<TaskControllers>().tasks.length,
      ),
    );
  }
}

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: kLightBlueColor,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.02,
          vertical: Get.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child:
                    Icon(Icons.bookmark_add, color: kLightBlueColor, size: 35),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: const Text(
                'All',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 52, top: 15),
              child:  Text(
                '${Get.find<TaskControllers>().tasks.length} Tasks',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
