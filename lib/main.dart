import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:noerani_cashier/modules/cart/cart.dart';
import 'package:noerani_cashier/modules/checkout/checkout.dart';

import 'modules/auth/auth.dart';
import 'modules/cashier/cashier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      defaultTransition: Transition.fade,
      getPages: [
        GetPage(
          name: "/splash", 
          page: () => SplashScreen()
        ),
        GetPage(
            name: "/login",
            page: () => const LoginScreen(),
            binding: AuthBindings()),
        GetPage(
            name: "/cashier",
            page: () => CashierScreen(),
            binding: CashierBindings()),
        GetPage(
            name: "/cart",
            page: () => CartScreen(),
            binding: CartBindings()
        ),
        GetPage(
          name: "/checkout", 
          page: () => CheckoutScreen(),
          binding: CheckoutBindings()
        ),
        GetPage(
          name: '/success', 
          page: () => CheckoutSuccessScreen()
        )
      ],
    );
  }
}
