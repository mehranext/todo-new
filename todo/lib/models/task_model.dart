class TaskModel {
  late final String id;
  late final String title;
  late final String text;
  late final DateTime createDate;
  late final bool check;

  TaskModel({
    required this.id,
    required this.title,
    required this.text,
    required this.createDate,
    required this.check,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    createDate = json['createDate'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'createDate': createDate,
        'check': check,
      };
}
