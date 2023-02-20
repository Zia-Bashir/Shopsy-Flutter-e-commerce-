// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/services/storage_services.dart';
import 'package:shopsy/src/utils/storage.dart';

class SplashController extends GetxController {
  RxBool animate = false.obs;
  var onBoarding = false;
  var logIn = false;
  static AuthController authController = Get.find();

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;

    //// OnBoarding
    onBoarding = StorageServices.to.getBool(ONBOARDING_SCREEN);
    logIn = StorageServices.to.getBool(LOGIN_STATE);
    onboardingScreen();

    Future.delayed(const Duration(seconds: 5), (() {
      if (onBoarding == true) {
        if (logIn == true) {
          Get.offAllNamed("/navbar");
        } else {
          Get.offAllNamed("/login");
        }
      } else {
        Get.offAllNamed("/onboarding");
      }
    }));
  }

  Future<bool> onboardingScreen() async {
    return await StorageServices.to.setBool(ONBOARDING_SCREEN, true);
  }
}
