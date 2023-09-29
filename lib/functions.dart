import 'package:flutter/material.dart';

import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

import 'config.dart';
import 'providers/user_provider.dart';
// import 'widgets/general/popup.dart';

dismissKeyboard({required BuildContext context}) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

isValidEmailAddress({required String email}) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

String addThousandsSpacing(String number) {
  //String strNumber = number.toString();

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]} ';

  return number.replaceAllMapped(reg, mathFunc as String Function(Match));
}

String formatMoney(double decimal) {
  List<String> parts = decimal.toStringAsFixed(2).split(".");

  parts[0] = addThousandsSpacing(parts[0]);

  return parts.join(".");
}

dynamic httpGet({
  required BuildContext context,
  required String endpoint,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  final Uri encodedUrl = Uri.parse("$apiURL/$endpoint");

  final response = await http.get(
    encodedUrl,
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer ${userProvider.accessToken!}",
    },
  );

  userProvider.statusCode = response.statusCode;
  return response.body;
}

dynamic httpPost({
  required BuildContext context,
  required String endpoint,
  required body,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  Uri url = Uri.parse("$apiURL/$endpoint");

  final response = await http.post(
    url,
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer ${userProvider.accessToken!}",
    },
    body: body,
  );

  userProvider.statusCode = response.statusCode;
  return response.body;
}

dynamic httpPut({
  required BuildContext context,
  required String endpoint,
  required body,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  Uri url = Uri.parse("$apiURL/$endpoint");

  final response = await http.put(
    url,
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer ${userProvider.accessToken!}",
    },
    body: body,
  );

  userProvider.statusCode = response.statusCode;
  return response.body;
}

dynamic httpDelete({
  required BuildContext context,
  required String endpoint,
  required body,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  Uri url = Uri.parse("$apiURL/$endpoint");

  final response = await http.delete(
    url,
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer ${userProvider.accessToken!}",
    },
    body: body,
  );

  userProvider.statusCode = response.statusCode;
  return response.body;
}

// autoLogout() {
//     //Log out after 55 minutes.
//     Future.delayed(const Duration(minutes: 55), () async {
//       if (mounted) {
//         //Show notification that we are now getting logged out.
//         await popup(
//           context: context,
//           title: "Warning",
//           messages: ["You are being logged out as your secure session has expired. Please log in again."],
//           type: PopupControlType.ok,
//           icon: PopupControlIcon.warning,
//         );

//         //Navigate to initial screen.
//         Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
//       }
//     });
//   }


