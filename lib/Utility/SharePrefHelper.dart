import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../shopifypkg/models/src/shopify_user/addresses/addresses.dart';

//class SharePrefHelper {
String isLogin = 'isLogin';
String userID = 'userID';
String userEmailID = 'userEmailID';
String userDisplayName = 'userDisplayName';
String userFirstName = "userFirstName";
String userLastName = "userLastName";
String userPhoneNo = "userPhoneNo";
String userAccessTocken = 'accessTocken';

bool isLoginOrNot = false;
String isLoginVal = '';
String userIDVal = '';
String userEmailIDVal = '';
String userDisplayNameVal = '';
String userFirstNameVal = "";
String userLastNameVal = "";
String userPhoneNoVal = "";
String userAccessTockenVal = '';
Addresses? address;

// Write DATA
Future<bool> saveUserData(key, value) async {
  value = value ?? "";
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return await sharedPreferences.setString(key, value);
}

// Read Data
Future getUserData(key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? valu = sharedPreferences.getString(key);
  String valu1 = valu ?? "";
  return valu1;
}
//}
