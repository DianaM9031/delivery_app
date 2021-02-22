import 'package:delivery_app/presentation/splash/splash_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  // final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: DeliveryColors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  color: DeliveryColors.purple,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: DeliveryColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
