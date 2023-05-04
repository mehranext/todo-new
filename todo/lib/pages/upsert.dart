import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';

class UpsertScreen extends StatelessWidget {
  UpsertScreen({Key? key}) : super(key: key);

  // Variables
  final titleText = TextEditingController();
  final messageText = TextEditingController();

  // Controllers
  final taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert new Task'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleText,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: messageText,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                label: Text('Text'),
                hintText: 'Write your text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: _submitTask,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Submit Task'),
                  Icon(Icons.check),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitTask() {
    TaskModel task = TaskModel(
      id: DateTime.now().toString(),
      title: titleText.text,
      text: messageText.text,
      createDate: DateTime.now(),
      check: false,
    );
    if (taskController.addTask(task)) {
      Get.back();
    } else {
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(Icons.error),
        title: 'Error',
        message: 'Error To Submit Task',
      ));
    }
  }
}
