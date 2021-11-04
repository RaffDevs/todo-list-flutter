import 'package:flutter/material.dart';
import 'package:teste/main.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({ 
    Key? key,
    required this.task,
    required this.handleComplete,
    required this.handleDelete,
    required this.handleUndo
  }) : super(key: key);

  final Map<String, dynamic> task;
  final void Function(Map<String, dynamic>, bool?) handleComplete;
  final void Function(String id) handleDelete;
  final void Function(Map<String, dynamic> task) handleUndo;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Widget get iconTask {
    if (widget.task["completed"]) {
      return  const Icon(
        Icons.done,
        color: ColorTheme.positive,
      );
    }

    return const Icon(
      Icons.error_outline,
      color: ColorTheme.info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: ColorTheme.negative,
        child: const Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(
            Icons.delete,
            color: ColorTheme.light,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) { 
        setState(() {
          widget.handleDelete(widget.task["id"]);

          final snack = SnackBar(
            content: Text('Tarefa ${widget.task["title"]}'),
            action: SnackBarAction(
              label: 'Desfazer', 
              onPressed: () {
                widget.handleUndo(widget.task);
              },
            ),
            duration: const Duration(seconds: 2),
          );

          ScaffoldMessenger.of(context).showSnackBar(snack);
        });

      },
      child: Card(
        elevation: 5,
        color: Theme.of(context).backgroundColor,
        child: CheckboxListTile(
          activeColor: ColorTheme.positive,
          title: Text(
            widget.task["title"],
            style: const TextStyle(
              color: ColorTheme.light
            ),
          ),
          value: widget.task["completed"],
          onChanged: (value) {
            widget.handleComplete(widget.task, value);
          },
          secondary: iconTask,
        ),
      ),
    );
  }
}