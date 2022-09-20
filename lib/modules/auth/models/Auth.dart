part of '../auth.dart';


class AuthResponse {
  AuthResponse({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });
  late final String tokenType;
  late final int expiresIn;
  late final String accessToken;
  late final String refreshToken;
  
  AuthResponse.fromJson(Map<String, dynamic> json){
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token_type'] = tokenType;
    _data['expires_in'] = expiresIn;
    _data['access_token'] = accessToken;
    _data['refresh_token'] = refreshToken;
    return _data;
  }
}
