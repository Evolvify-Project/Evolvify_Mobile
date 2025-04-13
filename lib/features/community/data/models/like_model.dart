class LikeModel {
  final String message;
  LikeModel({required this.message});
  factory LikeModel.fromJson(Map<String, dynamic> json) =>
      LikeModel(message: json['message']);
}
