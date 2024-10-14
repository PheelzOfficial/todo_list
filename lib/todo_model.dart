class TodoModel {
  String task;
  String date;
  bool completed;

  TodoModel({required this.task, required this.date, this.completed = false});
}
