import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.token,
    this.privateToken,
  });

  String token;
  String privateToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        privateToken: json["privatetoken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "privatetoken": privateToken,
      };
}
