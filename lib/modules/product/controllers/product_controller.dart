part of '../product.dart';

class ProductController extends GetxController with StateMixin<Product> {
  RxString subCategoryId = "0".obs;
  // var defaultValue = -1.obs;
  
  @override
  void onInit() {
    super.onInit();
    getProductsBySubCategoryId(subCategoryId.value);
  }

  void getProductsBySubCategoryId(String subCategoryId) {
    change(null, status: RxStatus.loading());
    ProductService().getProducts(subCategoryId).then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

  void getProductsByName(String name) async {
    change(null, status: RxStatus.loading());
    await Future.delayed(Duration(seconds: 3));
    ProductService().getProductsByName(name).then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
