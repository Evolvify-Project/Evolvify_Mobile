import 'package:equatable/equatable.dart';

class ReplyModel extends Equatable {
  final String? id;
  final String? userId;
  final String? content;
  final String? createdAt;
  final int? likesCount;
  final int? repliesCount;
  final List<dynamic>? replies;

  const ReplyModel({
    this.id,
    this.userId,
    this.content,
    this.createdAt,
    this.likesCount,
    this.repliesCount,
    this.replies,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
    id: json['id'] as String?,
    userId: json['userId'] as String?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String?,
    likesCount: json['likesCount'] as int?,
    repliesCount: json['repliesCount'] as int?,
    replies: json['replies'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'content': content,
    'createdAt': createdAt,
    'likesCount': likesCount,
    'repliesCount': repliesCount,
    'replies': replies,
  };

  @override
  List<Object?> get props {
    return [id, userId, content, createdAt, likesCount, repliesCount, replies];
  }
}
