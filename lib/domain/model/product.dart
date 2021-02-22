import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String description;
  final String image;
  final double price;

  const Product({
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.price,
  });
}
