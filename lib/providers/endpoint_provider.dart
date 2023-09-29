import 'package:flutter/foundation.dart';

class EndpointProvider with ChangeNotifier {
  String? _endpoint = "";
  String? get endpoint => _endpoint;
  set endpoint(String? newVal) {
    _endpoint = newVal;
    notifyListeners();
  }
}
