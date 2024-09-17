class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Task.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        note = res['note'],
        isCompleted = res['isCompleted'],
        date = res['date'],
        startTime = res['startTime'],
        endTime = res['endTime'],
        color = res['color'],
        remind = res['remind'],
        repeat = res['repeat'];
}
