import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemCount: taskData.tasksCount,
        itemBuilder: (context, index) => TaskTile(
          title: taskData.tasks[index].name,
          isChecked: taskData.tasks[index].isDone,
          toggleCheckbox: (checkboxState) => taskData.toggleTaskByIndex(index),
          deleteTask: () => taskData.deleteTaskByIndex(index),
        ),
      ),
    );
  }
}
