import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/home_controller.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'products/products_screen.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  return IndexedStack(
                    index: controller.indexSelected.value,
                    children: [
                      ProductsScreen(),
                      const Placeholder(),
                      CartScreen(
                        onShopping: () {
                          controller.indexSelected.value = 0;
                        },
                      ),
                      const Placeholder(),
                      ProfileScreen(),
                    ],
                  );
                },
              ),
            ),
            Obx(
              () => _DeliveryNavigationBar(
                index: controller.indexSelected.value,
                onIndexSelected: (index) {
                  controller.updateIndexSelected(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  _DeliveryNavigationBar({
    Key key,
    this.index,
    this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: index == 0
                        ? DeliveryColors.green
                        : DeliveryColors.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(0),
                ),
              ),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.store_outlined,
                    color: index == 1
                        ? DeliveryColors.green
                        : DeliveryColors.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(1),
                ),
              ),
              Material(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: DeliveryColors.purple,
                      radius: 23.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                          color: index == 2
                              ? DeliveryColors.green
                              : DeliveryColors.white,
                        ),
                        onPressed: () => onIndexSelected(2),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Obx(
                        () => cartController.totalItems.value == 0
                            ? const SizedBox.shrink()
                            : CircleAvatar(
                                radius: 10.0,
                                backgroundColor: Colors.pinkAccent,
                                child: Text('${cartController.totalItems.value}'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: index == 3
                        ? DeliveryColors.green
                        : DeliveryColors.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(3),
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: Obx(
                  () {
                    final user = controller.user.value;
                    return user.image == null
                        ? const SizedBox.shrink()
                        : CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage(
                              user.image,
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
