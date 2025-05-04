import 'package:equatable/equatable.dart';

import 'reply.dart';

class CommentModel extends Equatable {
  final String? id;
  final String? content;
  final String? createdAt;
  final dynamic parentCommentId;
  final String? userId;
  final int? likesCount;
  final int? repliesCount;
  final List<ReplyModel>? replies;

  const CommentModel({
    this.id,
    this.content,
    this.createdAt,
    this.parentCommentId,
    this.userId,
    this.likesCount,
    this.repliesCount,
    this.replies,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json['id'] as String?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String?,
    parentCommentId: json['parentCommentId'] as dynamic,
    userId: json['userId'] as String?,
    likesCount: json['likesCount'] as int?,
    repliesCount: json['repliesCount'] as int?,
    replies:
        (json['replies'] as List<dynamic>?)
            ?.map((e) => ReplyModel.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'createdAt': createdAt,
    'parentCommentId': parentCommentId,
    'userId': userId,
    'likesCount': likesCount,
    'repliesCount': repliesCount,
    'replies': replies?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      createdAt,
      parentCommentId,
      userId,
      likesCount,
      repliesCount,
      replies,
    ];
  }
}
