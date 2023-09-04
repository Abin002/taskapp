import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/views/addtask.dart';

import '../gegtxcontroller/listcontroller.dart';

class ScreenHome extends StatelessWidget {
  final ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasker'),
      ),
      body: Obx(
        () => Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Total tasks: ${listController.tasks.length}'),
                  Text(
                    'Completed tasks: ${listController.completedTasks.length}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: listController.tasks.length,
              itemBuilder: (context, index) {
                final task = listController.tasks[index];
                final isCompleted =
                    task.completed.value; // Access the value property

                return Card(
                  color: isCompleted ? Colors.blueGrey[100] : null,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        task.title,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    subtitle: Text(task.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.done_all_outlined),
                          onPressed: () {
                            if (!isCompleted) {
                              listController.markTaskAsCompleted(task, index);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Show a confirmation dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirm Delete'),
                                  content: Text(
                                      'Are you sure you want to delete this task?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Delete'),
                                      onPressed: () {
                                        // Delete the task
                                        listController.removeTask(index);
                                        listController
                                            .removeCompletedTask(task);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddTask());
        },
        label: Text('Add Task'),
      ),
    );
  }
}
