import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  //? Controller
  final taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    _loadTasks();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Todo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: tasks.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var task = tasks.value[index];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      task.createDate.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _addTask() {
    Get.toNamed('/upsertTask');
  }

  void _loadTasks() {
    tasks.value = taskController.readTasks();
  }
}
