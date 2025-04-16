class CommentModel {
  final String id;
  final String content;
  final String userId;
  final String postId;

  CommentModel({
    required this.id,
    required this.content,
    required this.userId,
    required this.postId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json['content'],
      userId: json['userId'],
      postId: json['postId'] ?? '',
    );
  }
}
