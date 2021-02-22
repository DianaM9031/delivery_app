import 'package:delivery_app/presentation/main_binding.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
