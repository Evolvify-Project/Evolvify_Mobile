import 'package:equatable/equatable.dart';

import 'comment.dart';

class PostModel extends Equatable {
  final String? id;
  final String? content;
  final dynamic username;
  final String? createdAt;
  final String? userId;
  final int? likesCount;
  final int? commentsCount;
  final List<CommentModel>? comments;

  const PostModel({
    this.id,
    this.content,
    this.username,
    this.createdAt,
    this.userId,
    this.likesCount,
    this.commentsCount,
    this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'] as String?,
    content: json['content'] as String?,
    username: json['username'] as dynamic,
    createdAt: json['createdAt'] as String?,
    userId: json['userId'] as String?,
    likesCount: json['likesCount'] as int?,
    commentsCount: json['commentsCount'] as int?,
    comments:
        (json['comments'] as List<dynamic>?)
            ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'username': username,
    'createdAt': createdAt,
    'userId': userId,
    'likesCount': likesCount,
    'commentsCount': commentsCount,
    'comments': comments?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      username,
      createdAt,
      userId,
      likesCount,
      commentsCount,
      comments,
    ];
  }
}
