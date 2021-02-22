import 'package:delivery_app/presentation/home/home_binding.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_binding.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/splash/splash_binding.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
