class TodoModel {
  String task;
  DateTime date;
  bool completed;

  TodoModel({required this.task, required this.date, this.completed = false});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        task: json['task'], date: json['date'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {"task": task, "date": date, "completed": completed};
  }
}
