import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }

    if (!found) {
      temp.add(
        ProductCart(product: product),
      );
    }

    cartList.assignAll(List<ProductCart>.from(temp));

    calculateTotal(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList.assignAll(List<ProductCart>.from(cartList));
    calculateTotal(cartList);
  }

  void decrement(ProductCart productCart) {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
      cartList.assignAll(List<ProductCart>.from(cartList));
      calculateTotal(cartList);
    }
  }

  void calculateTotal(List<ProductCart> temp) {
    final total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total.toInt());

    final totalCost = temp.fold(
        0, (previousValue, element) => (element.quantity *
        element.product.price) + previousValue);
    totalPrice(totalCost.toDouble());
  }

  void deleteProduct(ProductCart productCart) {
    cartList.remove(productCart);
    calculateTotal(cartList);
  }
}
