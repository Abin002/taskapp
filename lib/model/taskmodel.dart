import 'package:get/get.dart';

class TaskModel {
  final String title;
  final String description;
  final RxBool completed; // Use RxBool for the completed property

  TaskModel(this.title, {this.description = '', bool completed = false})
      : completed = RxBool(completed); // Initialize completed as an RxBool

  // Helper method to toggle the completed status
  void toggleCompleted() {
    completed.value = !completed.value;
  }
}
