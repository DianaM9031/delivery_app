import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({this.apiRepositoryInterface});

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    // productList.addAll(result);
    productList.assignAll(result);
  }
}
