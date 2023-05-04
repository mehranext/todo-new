import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/models/task_model.dart';

class TaskController extends GetxController {
  List<TaskModel> readTasks() {
    var storage = GetStorage();

    List<TaskModel> tasks = [];

    var keys = storage.getKeys();
    for (var key in keys) {
      var task = storage.read(key);
      if (task != null) {
        tasks.add(task);
      }
    }

    return tasks;
  }

  bool addTask(TaskModel task) {
    try {
      var storage = GetStorage();
      storage.write(task.id, task.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateTask(TaskModel task) {
    try {
      var storage = GetStorage();
      var exist = storage.read(task.id);
      if (exist != null) {
        storage.remove(task.id);
      }
      storage.write(task.id, task);
      return true;
    } catch (e) {
      return false;
    }
  }
}
