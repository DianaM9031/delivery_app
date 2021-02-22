import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface =
      Get.find<LocalRepositoryInterface>();
  final ApiRepositoryInterface apiRepositoryInterface =
      Get.find<ApiRepositoryInterface>();

  ProfileController();

  Rx<User> userProfile = User.empty().obs;
  RxBool darkTheme = false.obs;

  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface
        .getUser()
        .then((currentUser) => userProfile(currentUser));
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }

  void loadCurrentTheme() {
    localRepositoryInterface.isDarkMode().then(
          (currentTheme) => darkTheme(currentTheme),
        );
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }
}
