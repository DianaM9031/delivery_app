import 'package:delivery_app/presentation/login/login_controller.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const logoSize = 45.0;

class LoginScreen extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(DeliveryRoutes.home);
    } else {
      Get.snackbar('Error', 'Login incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 1.0],
                              colors: deliveryGradients,
                            ),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(200),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30.0),
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 50.0),
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle
                                    .color,
                              ),
                        ),
                        TextField(
                          controller: controller.usernameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'username',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle
                                    .color,
                              ),
                        ),
                        TextField(
                          controller: controller.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: DeliveryButton(
                  width: width,
                  text: 'Login',
                  onTap: login,
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Obx(
              () {
                if (controller.loginState.value == LoginState.loading) {
                  return Container(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
