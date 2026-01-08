class ActivityModel {
  String title;
  String content;
  String category;
  String? notes;
  DateTime startedAt, finishedAt;


  ActivityModel({
    required this.title,
    required this.content,
    required this.category,
    this.notes,
    required this.startedAt,
    required this.finishedAt,
  });
}
