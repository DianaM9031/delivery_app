import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/request/login_request.dart';
import 'package:delivery_app/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
