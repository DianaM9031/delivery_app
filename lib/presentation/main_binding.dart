import 'package:delivery_app/data/datasource/api_repository_impl.dart';
import 'package:delivery_app/data/datasource/local_repository_impl.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalRepositoryInterface>(LocalRepositoryImpl());
    Get.put<ApiRepositoryInterface>(ApiRepositoryImpl());
  }

}
