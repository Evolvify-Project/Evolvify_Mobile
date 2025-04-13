class ReplyModel {
  final String id;
  final String content;
  ReplyModel({required this.id, required this.content});
  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      ReplyModel(id: json['id'], content: json['content']);
}
