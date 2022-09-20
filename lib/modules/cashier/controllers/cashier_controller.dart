part of '../cashier.dart'; 

class CashierController extends GetxController {

  RxInt quantity = 1.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void addValue() {
    quantity.value++;
  }

  void removeValue() {
    quantity.value == 0 ? quantity.value = 0  : quantity.value--;
  }

  
}

class CashierBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashierController());
  }
}