
import 'package:flutter/material.dart';
import 'package:teste/modules/tasks/page/page_task.dart';

main() {
  runApp(const MyTask());
}

class MyTask extends StatelessWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        primaryColor: const Color(0xFF282a36),
        backgroundColor: const Color(0xFF282a36),
      )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTasks'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        titleTextStyle: const TextStyle(
          color: Colors.white
        ) ,
      ),

      body: const TaskPage()
    );
  }
}

class ColorTheme {
  static const positive  =  Color(0xFF50fa7b);
  static const negative =  Color(0xFFff5555);
  static const secondary = Color(0XFF44475a);
  static const contrast = Color(0xFF6272a4);
  static const light = Color(0xFFf8f8f2);
  static const info = Color(0xFF8be9fd);
}