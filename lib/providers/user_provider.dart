import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _accessToken = "";
  String? get accessToken => _accessToken;
  set accessToken(String? newVal) {
    _accessToken = newVal;
    notifyListeners();
  }

  String? _refreshToken = "";
  String? get refreshToken => _refreshToken;
  set refreshToken(String? newVal) {
    _refreshToken = newVal;
    notifyListeners();
  }

  late int _statusCode;
  int get statusCode => _statusCode;
  set statusCode(int newVal) {
    _statusCode = newVal;
    notifyListeners();
  }

  String? _typeCode;
  String? get typeCode => _typeCode;
  set typeCode(String? newVal) {
    _typeCode = newVal;
    notifyListeners();
  }

  String? _email = "";
  String? get email => _email;
  set email(String? newVal) {
    _email = newVal;
    notifyListeners();
  }

  String _wallet = "";
  String get wallet => _wallet;
  set wallet(String newVal) {
    _wallet = newVal;
    notifyListeners();
  }

  String _password = "";
  String get password => _password;
  set password(String newVal) {
    _password = newVal;
    notifyListeners();
  }

  String? _name = "";
  String? get name => _name;
  set name(String? newVal) {
    _name = newVal;
    notifyListeners();
  }

  String? _surname = "";
  String? get surname => _surname;
  set surname(String? newVal) {
    _surname = newVal;
    notifyListeners();
  }

  String? _cellCountryCode = "";
  String? get cellCountryCode => _cellCountryCode;
  set cellCountryCode(String? newVal) {
    _cellCountryCode = newVal;
    notifyListeners();
  }

  String? _userCellNumber = "";
  String? get userCellNumber => _userCellNumber;
  set userCellNumber(String? newVal) {
    _userCellNumber = newVal;
    notifyListeners();
  }

  String? _userTemporaryCellNumber = "";
  String? get userTemporaryCellNumber => _userTemporaryCellNumber;
  set userTemporaryCellNumber(String? newVal) {
    _userTemporaryCellNumber = newVal;
    notifyListeners();
  }

  String _country = "";
  String get country => _country;
  set country(String newVal) {
    _country = newVal;
    notifyListeners();
  }

  String? _user2faSecret = "";
  String? get user2faSecret => _user2faSecret;
  set user2faSecret(String? newVal) {
    _user2faSecret = newVal;
    notifyListeners();
  }

  String? _deviceId = "";
  String? get deviceId => _deviceId;
  set deviceId(String? newVal) {
    _deviceId = newVal;
    notifyListeners();
  }

  String _referredBy = "";
  String get referredBy => _referredBy;
  set referredBy(String newVal) {
    _referredBy = newVal;
    notifyListeners();
  }

  String _idNumber = "";
  String get idNumber => _idNumber;
  set idNumber(String newVal) {
    _idNumber = newVal;
    notifyListeners();
  }

  String _addressLine1 = "";
  String get addressLine1 => _addressLine1;
  set addressLine1(String newVal) {
    _addressLine1 = newVal;
    notifyListeners();
  }

  String _addressLine2 = "";
  String get addressLine2 => _addressLine2;
  set addressLine2(String newVal) {
    _addressLine2 = newVal;
    notifyListeners();
  }

  String _suburb = "";
  String get suburb => _suburb;
  set suburb(String newVal) {
    _suburb = newVal;
    notifyListeners();
  }

  String _city = "";
  String get city => _city;
  set city(String newVal) {
    _city = newVal;
    notifyListeners();
  }

  String _postalCode = "";
  String get postalCode => _postalCode;
  set postalCode(String newVal) {
    _postalCode = newVal;
    notifyListeners();
  }

  String? _rating = "";
  String? get rating => _rating;
  set rating(String? newVal) {
    _rating = newVal;
    notifyListeners();
  }

  String? _programUserName;
  String? get programUserName => _programUserName;
  set programUserName(String? newVal) {
    _programUserName = newVal;
    notifyListeners();
  }

  String? _programUserSurname;
  String? get programUserSurname => _programUserSurname;
  set programUserSurname(String? newVal) {
    _programUserSurname = newVal;
    notifyListeners();
  }

  String? _programUserEmail;
  String? get programUserEmail => _programUserEmail;
  set programUserEmail(String? newVal) {
    _programUserEmail = newVal;
    notifyListeners();
  }
}
