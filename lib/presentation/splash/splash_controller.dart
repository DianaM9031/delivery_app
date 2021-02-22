import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if(token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if(isDark != null) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }
}
