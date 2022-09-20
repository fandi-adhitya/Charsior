part of '../checkout.dart';

class CheckoutController extends GetxController{

  void createSell(Checkout checkout) async {
    GlobalDialog.showDialogLoading();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      await Service().dio.post(
        ApiUrl.sell, 
        data: jsonEncode(checkout.toJson()),
        options: Options(
          headers: {
             "Authorization" : "Bearer " + pref.getString("accessToken")!
          }
        )
      );
      Get.deleteAll();
      Get.toNamed('/success');
    } on DioError catch (e) {
      Get.back();
      GlobalSnackbar.showSnackbar("Server Error", "Try Again!", Icon(Icons.cancel, color: Colors.red));
    }
  }

}

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutBindings());
  }
}
