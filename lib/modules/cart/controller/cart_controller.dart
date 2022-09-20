part of '../cart.dart';

class CartController extends GetxController with StateMixin<Cart>{
  RxInt quantity = 1.obs;
  RxInt tempQuantity = 0.obs;

  RxDouble totalPrice2 = 0.0.obs;
  RxInt totalQuantity2 = 0.obs;

  RxList<Cart> cart = <Cart>[].obs;

  // int get totalQuantity => cart.fold(0, ((previousValue, element) => previousValue + element.quantity));
  // int get totalPrice => cart.fold(0, (((previousValue, element) => previousValue + element.price)));

  set setTotalPrice(RxDouble value) {
    if (value >= 0) {
      totalPrice2 = value;
    }
  }

  setTotalQuantity(RxInt value) {
    if (value >= 0) {
      totalQuantity2 = value;
    }
  }

  void addProductToCart(Cart data) {
    var contain = cart.where((element) =>
        element.id == data.id && element.variation == data.variation);
    if (contain.isEmpty) {
      cart.add(data);
    } else {
      int oldQuantity = cart[cart.indexWhere((element) =>
              element.id == data.id && element.variation == data.variation)]
          .quantity;
      int calculateQuantity = oldQuantity + data.quantity;
      cart[cart.indexWhere((element) =>
              element.id == data.id && element.variation == data.variation)]
          .quantity += data.quantity;
      cart[cart.indexWhere((element) =>
              element.id == data.id && element.variation == data.variation)]
          .totalPrice = data.price * calculateQuantity;
    }
    totalQuantity2.value = cart.fold(
        0, (previousValue, element) => previousValue + element.quantity);
    totalPrice2.value = cart.fold(
        0, (previousValue, element) => previousValue + element.totalPrice);
    update();
  }

  void addQuantity() {
    quantity.value++;
    update();
  }

  void subQuantity() {
    quantity.value == 1 ? quantity.value = 1 : quantity.value--;
    update();
  }

  void deleteFromCart(Cart data) {
    cart.removeWhere((element) =>
        element.id == data.id && element.variation == data.variation);
    totalQuantity2.value = cart.fold(
        0, (previousValue, element) => previousValue + element.quantity);
    totalPrice2.value = cart.fold(
        0, (previousValue, element) => previousValue + element.totalPrice);

    update();
  }

  void updateCart(Cart data, int quantity){
    var m = cart[cart.indexWhere((element) => element.id == data.id && element.variation == data.variation)].quantity = quantity;
    cart[cart.indexWhere((element) => element.id == data.id && element.variation == data.variation)].totalPrice = quantity * data.price;
    totalQuantity2.value = cart.fold(0, (previousValue, element) => previousValue + element.quantity);
    totalPrice2.value = cart.fold(0, (previousValue, element) => previousValue + element.totalPrice);
    update();
  }
}

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartBindings());
  }
}
