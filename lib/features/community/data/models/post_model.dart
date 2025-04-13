

class PostModel {
  final String id;
  final String content;
  final String createdAt;
  final String userId;
 
  final int likesCount;
  final List<Comment> comments;


  PostModel({required this.id, required this.content, required this.createdAt, required this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      createdAt: json['createdAt'],
      userId: json['userId'],
    );
  }
}








  