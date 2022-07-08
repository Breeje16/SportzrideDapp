// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const isNewUser = 'is_new_user';
  static const userId = 'user_id';
  static const String username = 'username';
  static const address = 'address';
  static const email = 'email';
  static const mnemonic = 'mnemonic';
  static const public_key = 'public_key';
  static const private_key = 'private_key';

  static Future<bool> clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> getIsNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNewUser) ?? true;
  }

  static Future setIsNewUser(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isNewUser, val);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }

  static Future setUserId(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userId, val);
  }

  static setUserName(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(username, val);
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(username);
  }

  static setAddress(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(address, val);
  }

  static Future<String?> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(address);
  }

  static setEmail(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(email, val);
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(email);
  }

  static setMnemonic(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(mnemonic, val);
  }

  static Future<String?> getMnemonic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(mnemonic);
  }

  static setPublicKey(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(public_key, val);
  }

  static Future<String?> getPublicKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(public_key);
  }

  static setPrivateKey(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(private_key, val);
  }

  static Future<String?> getPrivateKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(private_key);
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
