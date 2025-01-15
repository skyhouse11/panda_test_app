class UserModel {
  final String user;
  final String token;

  UserModel({
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json['user'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'token': token,
      };
}
