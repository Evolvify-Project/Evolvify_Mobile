
class Reply {
  final String id;
  final String content;
  Reply({required this.id, required this.content});
  factory Reply.fromJson(Map<String, dynamic> json) =>
      Reply(id: json['id'], content: json['content']);
}
