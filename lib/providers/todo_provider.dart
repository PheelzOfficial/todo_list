import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _tasks = [];

  List<TodoModel> get todo => _tasks;

  TodoProvider(){
    _loadTasks();
  }

  void showbottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text("Text Field can not be empty"));
        });
  }

  void addTask(
    BuildContext context,
    taskcontroller,
  ) {
    if (taskcontroller.text.isEmpty) {
      showbottom(context);
    } else {
      TodoModel newtask = TodoModel(
          task: taskcontroller.text, date: DateTime.now(), completed: false);
      _tasks.add(newtask);
      taskcontroller.clear();
      _saveTasks();
      notifyListeners();
    }
  }

  String formatdate(DateTime date) {
    String formattedDate = DateFormat('d/M/yyyy').format(date);
    return formattedDate;
  }

  void markcomplete(int index) {
    _tasks[index].completed = !_tasks[index].completed;
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasklist =
        _tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList("mytodo", tasklist);
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasklist = await prefs.getStringList("mytodo");
    if (tasklist != null) {
      _tasks.clear();
      _tasks.addAll(tasklist
          .map((task) => TodoModel.fromJson(jsonDecode(task)))
          .toList());

        notifyListeners();
    }
  }
}
