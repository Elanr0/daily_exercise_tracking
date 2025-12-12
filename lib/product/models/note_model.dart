class NoteModel {

  String title; 
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime doingAt;

  NoteModel({

   required this.title,
   required this.content,
   required this.createdAt,
   required this.updatedAt,
   required this.doingAt

  });

  static map() {}

  
}