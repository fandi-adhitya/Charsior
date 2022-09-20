
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formDeta;
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noerani_cashier/common/common.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';


part 'views/splash_screen.dart';
part 'views/login_screen.dart';

part 'controllers/auth_controllers.dart';
part 'models/Auth.dart';
part 'services/AuthServices.dart';
