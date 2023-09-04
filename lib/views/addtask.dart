import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gegtxcontroller/listcontroller.dart';
import '../model/taskmodel.dart';

class AddTask extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter title',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final taskTitle = titleController.text;
                  final taskDescription = descriptionController.text;
                  if (taskTitle.isNotEmpty) {
                    final task = TaskModel(
                      taskTitle,
                      description: taskDescription,
                    );
                    Get.find<ListController>().addTask(task);
                    titleController.clear();
                    descriptionController.clear();
                    Get.back();
                  } else {
                    Get.defaultDialog(
                      title: 'Title is required',
                      middleText: 'Please enter a title for the task.',
                      textConfirm: 'OK',
                      onConfirm: () {
                        Get.back();
                      },
                      radius: 10.0,
                      backgroundColor: Colors.red,
                      titleStyle: TextStyle(
                        color: Colors.white,
                      ),
                      middleTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      buttonColor: Colors.red,
                    );
                  }
                },
                child: Text('Save Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
