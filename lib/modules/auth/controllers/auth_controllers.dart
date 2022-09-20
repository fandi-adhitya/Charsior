part of '../auth.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  RxBool isOpenRegister = false.obs;


  @override
  void onReady() {
    super.onInit();
    // goToLoginPage();
  }

  Future<void> oauthToken(String username, String password) async {
    isLoading.value = true;
    GlobalDialog.showDialogLoading();
    try{
      var form = formDeta.FormData.fromMap({
        'grant_type' : 'password',
        'client_id' : 3,
        'client_secret' : 'cjd4jpUhqOpx2CKp4oQMoUsqTrjXJWTqSq6JgHQ1',
        'username' : username,
        'password' : password,
        'scope' : ''
      });

      // bool prefs = await Preferences().checkOpenCashRegister();
      final response = await Service().dio.post(ApiUrl.login, data: form,);
      AuthResponse _authResponse = AuthResponse.fromJson(response.data);
      await Preferences().setToken(_authResponse.accessToken);
      // Get.back();
      Get.toNamed("/cashier");
    } on DioError catch (e) {
      Get.back();
      GlobalSnackbar.showSnackbar("Wrong username & password", "Please re-check", Icon(Icons.cancel, color: Colors.red));
    }
  }
  
  void userLoggedIn() async {
    var response = AuthService().isLoggedIn();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("accessToken") == null ){
      Get.toNamed("/login");
    }
    else{
      return response.then((value) => value == true ? Get.toNamed("/cashier") : Get.toNamed("/login"));
    }
  }

  Future<bool> goToLoginPage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed("/login");
    return true;
  }

  void goToCashierPage() {
    Get.offAllNamed("/cashier");
  }
}


class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
