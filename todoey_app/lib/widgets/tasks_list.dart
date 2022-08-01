import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              task.name,
              task.isDone,
              (checkboxState) {
                taskData.updateTask(task);
              },
              () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
