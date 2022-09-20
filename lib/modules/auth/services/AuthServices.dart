part of '../auth.dart';

class AuthService { 
  Future<bool> isLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString("accessToken") == null) {
      return false;
    } 
    try {
      var response = await Service().dio.get(ApiUrl.isLoggedIn, options: Options(
        headers: {
          "Authorization" : "Bearer " + pref.getString("accessToken")!
        }
      ));
      return true;
    } on DioError catch(e) {
      return false;
    }
  }
}