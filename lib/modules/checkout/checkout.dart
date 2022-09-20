
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:noerani_cashier/modules/cart/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/common.dart';

part 'views/checkout_screens.dart';
part 'views/checkout_success_screen.dart';
part 'models/Checkout.dart';

part 'controllers/checkout_controller.dart';