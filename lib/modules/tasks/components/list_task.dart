import 'package:flutter/material.dart';
import 'package:teste/modules/tasks/components/item_task.dart';
import 'package:teste/modules/tasks/services/service_task.dart';

class ListTask extends StatefulWidget {
   const ListTask({
    Key? key,
    required this.taskService, 
    required this.taskList
  }) : super(key: key);

  final TaskService taskService;
  final List taskList;

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  int lastRemoveIndex = 0;

  @override
  Widget build(BuildContext context) {
    void completeTask(Map<String, dynamic> task, bool? value) {
      setState(() {
        final taskIndex = TaskService.taskList.indexOf(task);
        TaskService.taskList[taskIndex]["completed"] = value;
        widget.taskService.saveData();
      });
    }

    void deleteTask(String id) {
      setState(() {
        final taskElement = TaskService.taskList.firstWhere((task) => task['id'] == id);
        lastRemoveIndex = TaskService.taskList.indexOf(taskElement);
        TaskService.taskList.removeWhere((task) => task["id"] == id);
        widget.taskService.saveData();
      });
    }

    void undoTask(Map<String, dynamic> task) {
      setState(() {
        TaskService.taskList.insert(lastRemoveIndex, task);
        widget.taskService.saveData();
      });
    }

    Future<void> refresh() async {
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        widget.taskList.sort((a,b) {
          if (a["completed"] && !b["completed"]) {
            return 1;
          } 
          else if (!a["completed"] && b["completed"]) {
            return -1;
          }
          else {
            return 0;
          }
        });
      });
    }

    return Expanded(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: widget.taskList.length,
          itemBuilder: (context, index) {
            final currentTask = widget.taskList[index];
          
            return TaskItem(
              task: currentTask, 
              handleComplete: completeTask,
              handleDelete: deleteTask,
              handleUndo: undoTask,
            );
          },
        ),
      ),
    );
  }
}