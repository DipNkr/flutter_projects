import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      this.taskTitle, this.isChecked, this.checkboxCallback, this.onLongPress);
  final bool? isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
