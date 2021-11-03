import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teste/modules/tasks/components/input_task.dart';
import 'package:teste/modules/tasks/components/list_task.dart';
import 'package:teste/modules/tasks/services/service_task.dart';
import 'package:uuid/uuid.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskService = TaskService();
  List listTask = [];

  @override
  void initState() {
    super.initState();

    taskService.readData().then((value) => {
      setState(() {
        listTask = json.decode(value);
        TaskService.setTask = listTask;
      })
    });
  }

  @override
  Widget build(BuildContext context) {

    void createTask(TextEditingController taskController) {
      final taskTitle = taskController.text;

      if (taskTitle.isNotEmpty) {
        final task = {
          "id": const Uuid().v4(),
          "title": taskTitle,
          "completed": false
        };

        setState(() {
          listTask.add(task);
        });

        TaskService.setTask = listTask;

        taskService.saveData();

        taskController.clear();
      }
    
    }

    return  SizedBox.expand(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            InputTask(taskService: taskService, handleTask: createTask,),
            ListTask(taskService: taskService, taskList: listTask,)
          ],
        ),
      ),
    );
  }
}