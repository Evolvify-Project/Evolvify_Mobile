class Like {
  final String message;
  Like({required this.message});
  factory Like.fromJson(Map<String, dynamic> json) =>
      Like(message: json['message']);
}