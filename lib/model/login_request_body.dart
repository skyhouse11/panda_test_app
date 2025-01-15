class LoginRequestBody {
  final String? user;

  LoginRequestBody(this.user);

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      LoginRequestBody(
        json['user'],
      );

  Map<String, dynamic> toJson() => {
        'user': user,
      };
}
