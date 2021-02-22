import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  HomeController({
    this.localRepositoryInterface,
  });

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then((currentUser) => user(currentUser));
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }
}
