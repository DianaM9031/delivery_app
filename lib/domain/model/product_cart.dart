import 'package:delivery_app/domain/model/product.dart';

class ProductCart {
  final Product product;
  int quantity;

  ProductCart({
    this.product,
    this.quantity = 1,
  });
}
