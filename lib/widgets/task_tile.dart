import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    this.isChecked = false,
    this.title,
    required this.toggleCheckbox,
    required this.deleteTask,
  }) : super(key: key);

  final bool isChecked;
  final String? title;

  final void Function(bool? value) toggleCheckbox;

  final VoidCallback deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? "",
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleCheckbox,
      ),
      trailing: !Provider.of<TaskData>(context).deleteWhenChecked
          ? IconButton(
              onPressed: deleteTask,
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.redAccent,
              ),
            )
          : null,
    );
  }
}
