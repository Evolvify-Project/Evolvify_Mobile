import 'package:evolvify/features/community/data/models/comment_model.dart';

class PostModel {
  final String id;
  final String content;
  final String createdAt;
  final String userId;
  final int commentsCount;
  final int likesCount;
  final List<CommentModel> comments;

  PostModel({
    required this.commentsCount,
    required this.likesCount,
    required this.comments,
    required this.id,
    required this.content,
    required this.createdAt,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      createdAt: json['createdAt'],
      userId: json['userId'],
      likesCount: json["likesCount"],
      commentsCount: json["commentsCount"],
      comments:
          (json["comments"] as List)
              .map((e) => CommentModel.fromJson(e))
              .toList(),
    );
  }
}
