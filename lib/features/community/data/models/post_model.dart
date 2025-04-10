

class PostModel {
  final String content;

  PostModel({required this.content});
  
factory PostModel.fromJson(Map<String, dynamic> json)=>PostModel(content: json['content'] );


}










  