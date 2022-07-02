import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usermanagement/app/modules/home/views/home_view.dart';
import 'package:usermanagement/app/modules/login/views/login_view.dart';
import 'package:usermanagement/main.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(LoginView());
  }

  void checkUserLoggedIn() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfns.getBool(SAVE_KEY);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotologin();
    } else {
      Get.off(HomeView());
    }
  }
}
