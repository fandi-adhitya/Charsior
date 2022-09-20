part of '../taxonomies.dart';

class TaxonomiesService {
  Future<Taxonomies?> getTaxonomies() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {

      var response = await Service().dio.get(ApiUrl.taxonomies, options: Options(
        headers: {
          "Authorization" : "Bearer " + pref.getString("accessToken")!
        }
      ));
      return Taxonomies.fromJson(response.data);
    } catch(e) {
      throw e;
    }
  }
}