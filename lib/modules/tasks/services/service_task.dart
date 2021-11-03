import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TaskService {

  static List _tasks = [];

  static List get taskList {
    return _tasks;
  }

  static set setTask(List tasks) {
    _tasks = tasks;
  }

  Future<File> _getFile () async {
    final directory = await getApplicationDocumentsDirectory();

    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(_tasks);
    final file = await _getFile();

    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch(error) {
      print('An error ocurred while trying get data: $error');

      return '';
    }
  }

  void addTask(Map<String, dynamic> task) {    
    _tasks.add(task);
  }

}