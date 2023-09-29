import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../functions.dart';
import '../../../models/view/view_list_model.dart';
import '../../../providers/endpoint_provider.dart';

Future<ApiResponse> getApiResponse({
  required BuildContext context,
}) async {
  try {
    EndpointProvider endpointProvider =
        Provider.of<EndpointProvider>(context, listen: false);
    var response = await httpGet(
      context: context,
      endpoint: "api/v1/${endpointProvider.endpoint}/?q=(keys:!(none))",
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response);

    return ApiResponse.fromJson(decodedResponse);
    // return response;
  } catch (e) {
    String message = "Local Error:\n$e'";
    print(message);
    return ApiResponse(
      count: 0,
      ids: [],
      result: [],
    );
  }
}
