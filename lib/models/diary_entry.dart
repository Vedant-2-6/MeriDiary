// File: lib/models/diary_entry.dart

class DiaryEntry {
  String title;
  String content;
  DateTime date;
  String category;
  List<String> tags;

  DiaryEntry({
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    required this.tags,
  });
}
