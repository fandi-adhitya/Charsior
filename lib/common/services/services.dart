part of '../common.dart';


class Service {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.root,
      contentType: "application/json",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Accept" : "application/json",
        "Content-Type" : "application/json"
      }
    ),
  );
}