import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../functions.dart';
import '../../../models/home/menu_items_model.dart';

Future<MenuItems> getMenuItems({
  required BuildContext context,
}) async {
  try {
    var response = await httpGet(
      context: context,
      endpoint: "api/v1/menu/",
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response);

    return MenuItems.fromJson(decodedResponse);
  } catch (e) {
    String message = "Local Error:\n$e'";
    print(message);
    return MenuItems(
      result: [],
    );
  }
}
