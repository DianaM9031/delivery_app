import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/domain/exception/auth_exception.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/request/login_request.dart';
import 'package:delivery_app/domain/response/login_response.dart';

class ApiRepositoryImpl implements ApiRepositoryInterface {
  // Aqui se conecta con el API
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));

    if (token == 'AA111') {
      return User(
        name: 'Steve Jobs',
        username: 'stevejobs',
        image: 'assets/images/steve_jobs.jpg',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Elon Musk',
        username: 'elonmusk',
        image: 'assets/images/elon_musk.jpg',
      );
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 3));

    if (loginRequest.username == 'steve' &&
        loginRequest.password == 'jobs') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Steve Jobs',
          username: 'stevejobs',
          image: 'assets/images/steve_jobs.jpg',
        ),
      );
    } else if (loginRequest.username == 'elon' &&
        loginRequest.password == 'musk') {
      return LoginResponse(
        'AA222',
        User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/images/elon_musk.jpg',
        ),
      );
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server $token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
