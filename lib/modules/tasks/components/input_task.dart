import 'package:flutter/material.dart';
import 'package:teste/main.dart';
import 'package:teste/modules/tasks/services/service_task.dart';

class InputTask extends StatefulWidget {
  const InputTask({ 
    Key? key,
    required this.taskService,
    required this.handleTask
  }) : super(key: key);

  final TaskService taskService;
  final Function(TextEditingController) handleTask;

  @override
  _InputTaskState createState() => _InputTaskState();
}

class _InputTaskState extends State<InputTask> {
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          Expanded(
            child: TextField(
              controller: taskController,
              cursorColor: ColorTheme.positive,
              decoration: const InputDecoration(
                label: Text('Task'),
                floatingLabelStyle:TextStyle(
                  color: ColorTheme.positive
                ),
                labelStyle: TextStyle(
                  color: ColorTheme.contrast
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorTheme.secondary)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorTheme.positive)
                ),
              ),
              style: const TextStyle(
                color: ColorTheme.light
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => widget.handleTask(taskController),
            child: const Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              primary: ColorTheme.positive
            ),
          )
        ],
      ),
    );
  }
}