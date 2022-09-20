part of '../common.dart';

class Preferences {

  final bool isOpenCashRegister = false;

  Future<bool> checkOpenCashRegister() async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isOpenCashRegister") ?? isOpenCashRegister;
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
  }

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken") ?? "";
  }

}
