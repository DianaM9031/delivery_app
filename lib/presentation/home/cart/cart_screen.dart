import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  final VoidCallback onShopping;

  const CartScreen({
    Key key,
    this.onShopping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(
        () => controller.totalItems.value == 0
            ? _EmptyCart(
                onShopping: onShopping,
              )
            : _FullCart(),
      ),
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.cartList.length,
                scrollDirection: Axis.horizontal,
                itemExtent: 230,
                itemBuilder: (context, index) {
                  final productCart = controller.cartList[index];
                  return _ShoppingCartProduct(
                    productCart: productCart,
                    onDelete: () {
                      controller.deleteProduct(productCart);
                    },
                    onIncrement: () {
                      controller.increment(productCart);
                    },
                    onDecrement: () {
                      controller.decrement(productCart);
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Theme.of(context).canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub total',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                            Obx(
                              () => Text(
                                '\$${controller.totalPrice.value.toStringAsFixed(2)} USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Theme.of(context).accentColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                            Text(
                              'Free',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                '\$${controller.totalPrice.value.toStringAsFixed(2)} USD',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor,
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  DeliveryButton(
                    text: 'Checkout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _ShoppingCartProduct({
    Key key,
    this.productCart,
    this.onDelete,
    this.onIncrement,
    this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final product = productCart.product;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(height: 10.0),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: DeliveryColors.lightGrey,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: DeliveryColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('${productCart.quantity}'),
                              ),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.purple,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;

  const _EmptyCart({
    Key key,
    this.onShopping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/sad.png',
          height: 90.0,
          color: DeliveryColors.green,
        ),
        const SizedBox(height: 20.0),
        Text(
          'There are not products',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        const SizedBox(height: 20.0),
        Center(
          child: RaisedButton(
            onPressed: onShopping,
            color: DeliveryColors.purple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Go Shopping',
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
    );
  }
}
