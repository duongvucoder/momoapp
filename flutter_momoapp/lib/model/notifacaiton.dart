class Notification {
  final int id;
  final String createdDate;
  final String category;
  final String title;
  final String content;
  var Icons;
  final bool isRead;
  Notification({
    required this.id,
    required this.createdDate,
    required this.category,
    required this.title,
    required this.content,
    required this.Icons,
    required this.isRead,
  });
}
