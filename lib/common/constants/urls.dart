part of '../common.dart';

class ApiUrl {
  static const String root  = 'https://noeranikopi.qansa.my.id';
  static const String connector = '/connector/api';
  static const String login =  '/oauth/token';
  static const String isLoggedIn = connector + '/user/loggedin';
  static const String taxonomies = connector + '/taxonomy';
  static const String product = connector + '/product';
  static const String sell = connector + '/sell';
  
  static String productByCategory(String categoryId) {
    return connector + '/product?sub_category_id=' + categoryId;
  }

  static String productByName(String val) {
    return connector + '/product?name=' + val;
  }
}
