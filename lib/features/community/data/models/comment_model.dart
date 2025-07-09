import 'package:equatable/equatable.dart';

class CommentModel2 extends Equatable {
  final String? id;
  final String? content;
  final String? createdAt;
  final String? userId;
  final String? userName;
  final String? profileImage;
  final int? likesCount;
  final int? repliesCount;

  const CommentModel2({
    this.id,
    this.content,
    this.createdAt,
    this.userId,
    this.userName,
    this.profileImage,
    this.likesCount,
    this.repliesCount,
  });

  factory CommentModel2.fromJson(Map<String, dynamic> json) => CommentModel2(
    id: json['id'] as String?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String?,
    userId: json['userId'] as String?,
    userName: json['userName'] as String?,
    profileImage: json['profileImage'] as String?,
    likesCount: json['likesCount'] as int?,
    repliesCount: json['repliesCount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'createdAt': createdAt,
    'userId': userId,
    'userName': userName,
    'profileImage': profileImage,
    'likesCount': likesCount,
    'repliesCount': repliesCount,
  };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      createdAt,
      userId,
      userName,
      profileImage,
      likesCount,
      repliesCount,
    ];
  }
}
