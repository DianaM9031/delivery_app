import 'package:delivery_app/data/datasource/local_repository_impl.dart';
import 'package:delivery_app/presentation/home/profile/profile_controller.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = _controller.userProfile.value;
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: user.image != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: DeliveryColors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundImage: AssetImage(
                                user.image,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '${user.name}',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Card(
                            color: Theme.of(context).canvasColor,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Personal Information',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 25.0),
                                  Text(
                                    '${user.username}',
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Dark Mode',
                                      ),
                                      Obx(
                                        () => Switch(
                                          value: _controller.darkTheme.value,
                                          onChanged: onThemeUpdated,
                                          activeColor: DeliveryColors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: RaisedButton(
                            onPressed: logOut,
                            color: DeliveryColors.purple,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: DeliveryColors.white,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      );
    });
  }

  Future<void> logOut() async {
    await _controller.logOut();
    Get.offAllNamed(DeliveryRoutes.splash);
  }

  void onThemeUpdated(bool isDark) {
    _controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }
}
