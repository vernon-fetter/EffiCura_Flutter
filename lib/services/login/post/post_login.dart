import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../functions.dart';
import '../../../models/login/access_token_model.dart';

Future<AccessToken> userSignIn({
  required BuildContext context,
  required UserSignInRequest request,
}) async {
  try {
    String json = jsonEncode(request);
    var response = await httpPost(
      context: context,
      endpoint: "api/v1/security/login",
      body: json,
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response);

    return AccessToken.fromJson(decodedResponse);
  } catch (e) {
    String message = "Local Error: \n $e'";
    print(message);
    return AccessToken();
  }
}

class UserSignInRequest {
  final String? userEmail;
  final String? userPassword;

  UserSignInRequest({
    this.userEmail,
    this.userPassword,
  });

  Map<String, dynamic> toJson() => {
        'username': userEmail,
        'password': userPassword,
        'provider': 'db',
        'refresh': true,
      };
}
