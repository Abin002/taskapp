import 'package:get/get.dart';
import '../model/taskmodel.dart';

class ListController extends GetxController {
  // Define an observable list to store TaskModel instances
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  // Define an observable list to store completed TaskModel instances
  RxList<TaskModel> completedTasks = <TaskModel>[].obs;

  // Method to add a task to the list
  void addTask(TaskModel task) {
    tasks.add(task);
  }

  // Method to remove a task from the list
  void removeTask(int index) {
    tasks.removeAt(index);
  }

  // Method to mark a task as completed
  void markTaskAsCompleted(TaskModel task, int index) {
    if (!completedTasks.contains(task)) {
      completedTasks.add(task);
    }
    task.toggleCompleted(); // Toggle the completed status using the toggleCompleted method
    update(); // Update any other necessary logic
  }

  // Method to remove a completed task
  void removeCompletedTask(TaskModel task) {
    completedTasks.remove(task);
    // Update any other necessary logic
  }
}
