import 'dart:convert';

AccessToken accessTokenFromJson(String str) =>
    AccessToken.fromJson(json.decode(str));

String accessTokenToJson(AccessToken data) => json.encode(data.toJson());

class AccessToken {
  String? accessToken;
  String? refreshToken;
  String? message;

  AccessToken({this.accessToken, this.refreshToken, this.message});

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "message": message,
      };
}
