class AuthModel {
  String? username;
  String? email;
  String? password;
  String? confirmPassword;
  String? token;

  AuthModel({
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    username: json['username'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirmPassword'] as String?,
    token: json['token'] as String,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
    'token': token,
  };
}
