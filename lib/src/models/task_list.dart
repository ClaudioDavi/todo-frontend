class TaskList {
  final int id;
  final String title;

  TaskList({this.id, this.title});

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      id: json['id'],
      title: json['title'],
    );
  }
}
