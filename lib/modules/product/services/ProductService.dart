part of '../product.dart';


class ProductService {
  Future<Product?> getProducts(String subCategoryId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var response = await Service().dio.get(ApiUrl.productByCategory(subCategoryId), options: Options(
        headers: {
          "Authorization" : "Bearer " + pref.getString("accessToken")!
        }
      ));
      return Product.fromJson(response.data);
    } catch(e) {
      throw e;
    }
  }

  Future<Product?> getProductsByName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var response = await Service().dio.get(ApiUrl.productByName(name), options: Options(
        headers: {
          "Authorization" : "Bearer " + pref.getString("accessToken")!
        }
      ));
      return Product.fromJson(response.data);
    } catch(e) {
      throw e;
    }
  }
}